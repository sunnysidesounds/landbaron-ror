# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  investment_id :integer
#  user_id       :integer
#  value         :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Vote < ActiveRecord::Base

  belongs_to :investment

  validates_presence_of :user_id, :on => :create
  validates_presence_of :investment_id, :on => :create
  validates_presence_of :value, :on => :create


  def get_votes_by_investment(id)
    @vote = Vote.where(:investment_id => id)

  end

  def get_vote_by_user(uid, iid)
    @vote = Vote.where(:investment_id => iid, :user_id => uid)
  end

  def get_vote_by_user_exist(uid, iid, val)
    @vote = Vote.where(:investment_id => iid, :user_id => uid, :value => val).any?
  end


  def get_vote_count_by_investment(id)
    sql ='SELECT
    sum(CASE WHEN VALUE  = 1 THEN 1 ELSE 0 END) AS t,
    sum(CASE WHEN VALUE  = 0 THEN 1 ELSE 0 END) AS f FROM votes WHERE investment_id = ' + id
    @list = ActiveRecord::Base.connection.execute(sql)

  end




end
