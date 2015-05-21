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
