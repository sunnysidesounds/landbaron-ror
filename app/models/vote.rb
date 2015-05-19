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

  def get_vote_count_by_investment(id)


   # SELECT
   # (SELECT COUNT(value) FROM votes WHERE VALUE = true) AS true,
   # (SELECT COUNT(value) FROM votes WHERE VALUE = false) AS false
   # FROM votes
   # WHERE investment_id = 5 LIMIT 1;


  end




end
