class VotesController < ApplicationController

  def index
  end

  def create_vote
    @vote = Vote.new(vote_params)
    if @vote.valid?
      @vote.save

      # Maybe send email?


      # Redirect to...

    else


      # Redirect to...


    end


  end

  def vote_params
    params.require(:vote).permit(:investment_id, :user_id, :value)
  end



end
