class VoteController < ApplicationController
  #respond_to :json

  def index
  end

  def create_vote

    vte = Vote.new
    @exist = vte.get_vote_by_user(vote_params[:user_id], vote_params[:investment_id])

    logger.debug '--------------------------------------'
    logger.debug vote_params[:user_id]
    logger.debug @exist.inspect
    logger.debug @exist.count


     if @exist.count == 0
       logger.debug 'no user, no investment, no value -- INSERT VOTE'
       @vote = Vote.create( vote_params )
        render :json => {:status => 'success', :data => @vote}



     else

       render :json => {:status => 'error', :data => 'error something '}

       logger.debug "is not present"


     end



    # Check is user has voted

    # If no user, no investment, no value
      # Insert vote

    # If with user, investment and same value
      # Do nothing, maybe response with a message

    # If with user, investment and difference value
      # Update the record







  end

  def vote_params
    params.require(:vote).permit(:investment_id, :user_id, :value)
  end



end
