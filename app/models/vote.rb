class Vote < ActiveRecord::Base

  validates_presence_of :user_id, :on => :create
  validates_presence_of :investment_id, :on => :create
  validates_presence_of :value, :on => :create


  def get_votes_by_investment(id)
    @vote = Vote.where(:investment_id => id)

  end

  def get_vote_by_user(uid, iid)
    @vote = Vote.where(:investment_id => iid, :user_id => uid)
  end




end
