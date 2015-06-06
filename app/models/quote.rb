# == Schema Information
#
# Table name: quotes
#
#  id                    :integer          not null, primary key
#  reference_id          :string
#  investment_id         :integer
#  user_id               :integer
#  total_amount          :string
#  investor_profile_type :string
#  status                :string
#  payment_methd         :string
#  created_at            :datetime
#  updated_at            :datetime
#

class Quote < ActiveRecord::Base

  
  belongs_to :investment

  validates_presence_of :total_amount, :on => :create
  validates_presence_of :investor_profile_type, :on => :create
  validates_presence_of :payment_methd, :on => :create

  before_create :generate_uuid, :unless => :reference_id?


  def get_progress_stats(inventment_id)
    sql = "SELECT COUNT(investment_id) as total_count, COALESCE(SUM(CAST(total_amount AS MONEY)), '0.00') as total_amount FROM quotes WHERE investment_id ="+inventment_id
    @list = ActiveRecord::Base.connection.execute(sql)
  end

  def new_get_progress_stats(inventment_id)
    # Q
    sum = 0
    Quote.where(investment_id: 5).map(&:total_amount).each { |q| sum += q.gsub('$', '').gsub(',','').to_i}
    sum
  end

  def generate_uuid
    self.reference_id = SecureRandom.uuid
  end


end
