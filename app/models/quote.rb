# == Schema Information
#
# Table name: quotes
#
#  id                    :integer          not null, primary key
#  reference_id          :string
#  investment_id         :integer
#  user_id               :integer
#  total_amount          :decimal(, )
#  investor_profile_type :string
#  status                :string
#  payment_methd         :string
#  created_at            :datetime
#  updated_at            :datetime
#

class Quote < ActiveRecord::Base

  
  belongs_to :investment
  belongs_to :user

  validates_presence_of :total_amount, :on => :create
  validates_presence_of :investor_profile_type, :on => :create
  validates_presence_of :payment_methd, :on => :create

  before_create :generate_uuid, :unless => :reference_id?
  after_create :send_emails

  PENDING = 'PENDING'
  DENIED = 'denied'
  ACCEPTED = 'accepted'
  STATUSES = [PENDING, DENIED, ACCEPTED]

  scope :pending, -> { where(status: PENDING) }
  scope :denied, -> { where(status: DENIED) }
  scope :accepted, -> { where(status: ACCEPTED) }

  def send_emails
    ConfirmationMailer.confirmation_email(self.user, self).deliver_now
    AdminMailer.admin_email(self.user, self).deliver_now
  end

  def generate_uuid
    self.reference_id = SecureRandom.uuid
  end


end
