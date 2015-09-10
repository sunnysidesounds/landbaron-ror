# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  username                    :string
#  email                       :string
#  first_name                  :string
#  last_name                   :string
#  password_hash               :string
#  password_salt               :string
#  phone_number                :string
#  address                     :string
#  city                        :string
#  state                       :string
#  postal_code                 :string
#  income_range                :string
#  principle_investor          :boolean
#  verified                    :boolean
#  created_at                  :datetime
#  updated_at                  :datetime
#  encrypted_password          :string           default(""), not null
#  password_migrated           :boolean          default(TRUE)
#  reset_password_token        :string
#  reset_password_sent_at      :datetime
#  remember_created_at         :datetime
#  sign_in_count               :integer          default(0), not null
#  current_sign_in_at          :datetime
#  last_sign_in_at             :datetime
#  current_sign_in_ip          :inet
#  last_sign_in_ip             :inet
#  country                     :string
#  property_types              :string
#  deal_types                  :string
#  budget_range                :string
#  risk_tolerance              :string
#  property_categories         :string
#  invested_in_realestate      :string
#  hear_about_us               :string
#  reason_to_invest            :string
#  current_investments         :string
#  annual_income_without_taxes :string
#  describes_you               :string
#  marketo_lead_id             :string
#  date_of_birth               :datetime
#  legal_name                  :string
#  tax_id_number               :string
#  fund_america_id             :string
#

require "marketo_api_helper"

class User < ActiveRecord::Base
  include MarketoApiHelper
  #has_many :orders
  # attr_accessible :email, :username, :password, :password_confirmation
  # attr_accessor :password
  # before_save :encrypt_password

  attr_accessor :login_attr

  has_many :quotes


  devise :database_authenticatable, 
    :recoverable, :registerable, :rememberable, :trackable, :validatable, :authentication_keys => [:login_attr]

  validates_presence_of :password, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  has_one :investor_accreditation
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }

  def sync_user_to_marketo_leads(is_dev_env=true)
    client = get_mrkt_client
    temp_email = "azlantaher@gmail.com" if is_dev_env
    temp_email = self.email unless temp_email
    # email_address, first_name, last_name, company, phone
    resp = set_mrkt_lead(temp_email, self.first_name, self.last_name || "COOL", '', self.phone_number)
    puts "**" * 100
    puts resp

    self.marketo_lead_id = resp.first[:id] if resp.is_a? Array
  end

  def full_name
    [self.first_name, self.last_name].join(" ")
  end


  def initialize(attributes = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login_attr = conditions.delete(:login_attr)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login_attr.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end

  def valid_password?(passed_password)
    unless self.password_migrated
      if self.password_hash == BCrypt::Engine.hash_secret(passed_password, self.password_salt) 
        self.attributes = { password: passed_password, password_confirmation: passed_password, password_migrated: true }
        self.save!
        super passed_password
      else
        return false
      end
    else
      super passed_password
    end
  end

  def to_fund_america_hash
    result = {
      type: "person",
      city: self.city,
      country: self.country,
      email: self.email,
      name: self.full_name,
      postal_code: self.postal_code,
      region: self.state,
      street_address_1: self.address,
      tax_id_number: "000000000"
    }
    result.merge!(date_of_birth: self.date_of_birth.strftime("%Y-%m-%d")) unless self.date_of_birth.nil?
    result.merge!(phone: self.phone_number.gsub(/[-(),. ]/, '')) unless self.phone_number.nil?
  end

  def create_user_on_fa!
    unless self.registered_to_fund_america?
      begin  
        resp = FundAmerica::Entity.create(self.to_fund_america_hash)
        self.update_attributes(fund_america_id: resp["id"])
        return true, "Successfully registered user on FA!"
      rescue FundAmerica::Error => e
        # Exception handling
        # e.parsed_response gives a response hash of the error response sent by FundAmerica
        puts "::::::::::::::::::::::::::::::::::::::Error IN FA::::::::::::::::::::::::::::::::::::"
        puts e.parsed_response
        puts "/n"
        puts e.message
        return false, e.parsed_response
      end
    else
      return true, "User already registered on FA!"
    end
  end

  def investor_accreditation_form_url
    self.investor_accreditation.try(:fund_america_form_url)
  end

  def registered_to_fund_america?
    !self.fund_america_id.blank?
  end

  def generate_investor_accreditation_link
    if self.registered_to_fund_america? and self.investor_accreditation.nil?
      begin
        resp = FundAmerica::API::request(:post, FundAmerica.base_uri + 'investor_accreditation_tokens', {entity_id: self.fund_america_id})
        self.create_investor_accreditation(fund_america_form_url: resp["url"])
        return true, "Successfully generated investor accreditation form url"
      rescue FundAmerica::Error => e
        # Exception handling
        # e.parsed_response gives a response hash of the error response sent by FundAmerica
        puts "::::::::::::::::::::::::::::::::::::::Error IN FA::::::::::::::::::::::::::::::::::::"
        puts e.parsed_response
        puts "/n"
        puts e.message
        return false, e.parsed_response
      end
    else
      return true, "Already initialized a form url for user" if self.registered_to_fund_america? and !(self.investor_accreditation.nil?)
      return false, "Something went wrong"
    end
  end

  def get_user(uid)
    @inv = User.find_by_id(uid)
  end


  end
