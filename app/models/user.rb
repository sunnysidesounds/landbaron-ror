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
#  user_status                 :string
#  terms_accepted              :boolean
#  self_accredition            :string
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
  has_one :investor_accreditation


  devise :database_authenticatable, 
    :recoverable, :registerable, :rememberable, :trackable, :validatable, :authentication_keys => [:login_attr]

  validates_presence_of :password, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }



  ACCEPTED = 'accepted'
  DENIED = 'denied'
  PENDING = 'pending'
  USER_STATUSES = [ACCEPTED, DENIED, PENDING]

  STATUSES = [InvestorAccreditation::CONFIRMED, InvestorAccreditation::PENDING, InvestorAccreditation::DENIED, InvestorAccreditation::EXPIRED]

  scope :list_all, -> { all }

  scope :accepted, -> { includes(:investor_accreditation).where(investor_accreditations: {status: InvestorAccreditation::CONFIRMED}) }
  scope :denied, -> { includes(:investor_accreditation).where(investor_accreditations: {status: InvestorAccreditation::DENIED}) }
  scope :pending, -> { includes(:investor_accreditation).where(investor_accreditations: {status: InvestorAccreditation::PENDING}) }
  scope :not_initiated, -> { includes(:investor_accreditation).where(investor_accreditations: {status: nil}) }


  scope :registered_on_fa, -> { where("fund_america_id is not null") }
  scope :not_registered_on_fa, -> { where(fund_america_id: nil) }


  after_create :email_admins
  before_create :set_appropriate_status


  def email_admins
    AdminMailer.account_creation_email(self).deliver_now if self.persisted?
    # AccountCreationMailer.account_creation_email(self).deliver_now if self.persisted?
  end

  def set_appropriate_status
    case self.self_accredition 
    when 'none'
      self.user_status = DENIED
    when 'net_worth' || 'anual_income' || 'buisness_check'
      self.user_status = PENDING
    end
  end

  def mark_user_as!(status)
    if USER_STATUSES.include?(status)
      return self.update_attributes(user_status: status)
    end
    false
  end

  def is_pending?
    self.user_status == PENDING || self.user_status.nil?
  end

  def is_denied?
    self.user_status == DENIED
  end

  def is_accepted?
    self.user_status == ACCEPTED
  end

  def sync_user_to_marketo_leads(is_dev_env=true)
    client = get_mrkt_client
    temp_email = "azlantaher@gmail.com" if is_dev_env
    temp_email = self.email unless temp_email
    # email_address, first_name, last_name, company, phone
    resp = set_mrkt_lead({ :email => temp_email,
          :firstName => self.first_name,
          :lastname => self.last_name,
          # :company => company,
          :phone => self.phone_number,
          :'Property_of_Interest__c' => self.property_types,
          :'Deal_of_Interest__c' => self.deal_types, 
          :'Invested_in_Real_Estate_Before__c' => self.invested_in_realestate
          # :'Annual_Net_Income_Before_Taxes__c' => self.annual_income_without_taxes
           })

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
      tax_id_number: self.tax_id_number
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
        return handle_fa_error(e, true)
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

  def accredition_status
    self.investor_accreditation.nil? ? "N/A" : self.investor_accreditation.status.blank? ? InvestorAccreditation::PENDING : self.investor_accreditation.status
  end

  def accredition_accepted? 
    self.investor_accreditation.try(:status) == InvestorAccreditation::CONFIRMED
  end

  def accredition_pending? 
    self.investor_accreditation.try(:status) == InvestorAccreditation::PENDING
  end

  def accredition_denied? 
    self.investor_accreditation.try(:status) == InvestorAccreditation::DENIED
  end

  def accredition_expired? 
    self.investor_accreditation.try(:status) == InvestorAccreditation::EXPIRED
  end

  def change_status_of_accreditation_if_test_mode(status='confirmed')
    if(self.fund_america_id and self.investor_accreditation)    
      if FundAmerica.mode and FundAmerica.mode == "sandbox"
        begin
          FundAmerica::API::request(:patch, FundAmerica.base_uri + "test_mode/entities/#{self.fund_america_id}/investor_accreditation", {status: status})
          return true, "Successfully marked user accreditation as #{status}"
        rescue FundAmerica::Error => e
          return handle_fa_error(e, true)
        end
      else
        return false, "Status can only be changed in sandbox mode"
      end
    else
      return false, "User is not registered to FA or no accreditation process started"
    end
  end

  def generate_investor_accreditation_link
    if self.registered_to_fund_america? and self.investor_accreditation.nil?
      begin
        resp = FundAmerica::API::request(:post, FundAmerica.base_uri + 'investor_accreditation_tokens', {entity_id: self.fund_america_id})
        self.create_investor_accreditation(fund_america_form_url: resp["url"])
        return true, "Successfully generated investor accreditation form url"
      rescue FundAmerica::Error => e
        return handle_fa_error(e, true)
      end
    else
      return true, "Already initialized a form url for user" if self.registered_to_fund_america? and !(self.investor_accreditation.nil?)
      return false, "Something went wrong"
    end
  end

  def handle_fa_error(e, do_ret=false)
    # Exception handling
    # e.parsed_response gives a response hash of the error response sent by FundAmerica
    puts "::::::::::::::::::::::::::::::::::::::Error IN FA::::::::::::::::::::::::::::::::::::"
    puts e.parsed_response
    puts "/n"
    puts e.message
    return false, e.parsed_response if do_ret
  end

  def get_user(uid)
    @inv = User.find_by_id(uid)
  end


  end
