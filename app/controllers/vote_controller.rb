class VoteController < ApplicationController
  #respond_to :json

  def index
  end

  def create_vote

    vte = Vote.new
    @exist = vte.get_vote_by_user(vote_params[:user_id], vote_params[:investment_id])
    record = @exist[0]

    logger.debug '--------------------------------------'
    logger.debug vote_params[:value]
    logger.debug @exist.inspect
   # logger.debug record.value
    logger.debug '--------------------------------------'


     if @exist.count == 0
       @vote = Vote.create( vote_params )
        render :json => {:status => 'success', :data => @vote, :message => 'Thank you for voting'}

     else
       if record.value.to_i == vote_params[:value].to_i
         render :json => {:status => 'error', :data => '', :message => 'You have already voted for this investment'}
       else
         vote = Vote.find_by(:investment_id => record.investment_id, :user_id => record.user_id)
         vote.value = vote_params[:value]
         vote.save


         counts = vte.get_vote_count_by_investment(vote.investment_id.to_s)


         logger.debug '--------------------------------------'
         logger.debug counts[0]
         logger.debug '--------------------------------------'


         render :json => {:status => 'success', :data => counts[0], :message => 'Updating your vote'}
       end

     end

  end

  def vote_params
    params.require(:vote).permit(:investment_id, :user_id, :value)
  end



end
