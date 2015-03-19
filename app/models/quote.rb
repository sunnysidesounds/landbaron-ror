class Quote < ActiveRecord::Base
  before_create :generate_uuid, unless: :reference_id?
private
  def generate_uuid
    self.reference_id = SecureRandom.uuid
  end

  validates_presence_of :total_amount, :on => :create
  validates_presence_of :investor_profile_type, :on => :create
  validates_presence_of :payment_methd, :on => :create
end
