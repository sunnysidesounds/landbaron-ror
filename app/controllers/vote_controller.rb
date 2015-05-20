class VoteController < ApplicationController

  def index
  end

  def create_vote
    @vote = Vote.create( vote_params )

    logger.debug "HERE"
    logger.debug vote_params

    respond_to do |format|
      format.html
      format.json  { render :json => vote}
    end


     # @vote = Vote.new(vote_params)
     # if @vote.valid?
     #   @vote.save
     #
     #   # Maybe send email?
     #
     #
     #   # Redirect to...
     #
     # else
     #
     #
     #   # Redirect to...
     #
     #
     # end


  end

  def vote_params
    params.require(:vote).permit(:investment_id, :user_id, :value)
  end



end
