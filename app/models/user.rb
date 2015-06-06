class User < ActiveRecord::Base
  #has_many :orders
  # attr_accessible :email, :username, :password, :password_confirmation
  # attr_accessor :password
  # before_save :encrypt_password

  attr_accessor :login_attr


  devise :database_authenticatable, 
    :recoverable, :registerable, :rememberable, :trackable, :validatable, :authentication_keys => [:login_attr]

  # validates_confirmation_of :password
  # validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :username, :on => :create
  validates_presence_of :first_name, :on => :create
  validates_presence_of :last_name, :on => :create
  validates_presence_of :phone_number, :on => :create
  validates_uniqueness_of :email
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }


  def initialize(attributes = {})
    super # must allow the active record to initialize!
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end


  # def self.authenticate_by_email(email, password)
  #   user = find_by_email(email)
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user
  #   else
  #     nil
  #   end
  # end

  # def self.authenticate_by_username(username, password)
  #   user = find_by_username(username)
  #   if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  #     user
  #   else
  #     nil
  #   end
  # end

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

  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end

  def get_user(uid)
    @inv = User.find_by_id(uid)
  end


  end
