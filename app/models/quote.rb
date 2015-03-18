class Quote < ActiveRecord::Base

  validates_presence_of :total_amount, :on => :create
  validates_presence_of :investor_profile_type, :on => :create
  validates_presence_of :payment_methd, :on => :create
  validates_uniqueness_of :investment_id, :scope => :user_id, :message => "record already exists!"


end
