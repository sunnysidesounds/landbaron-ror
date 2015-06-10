class InvestmentsController < ApplicationController

  def index
    @available = Investment.get_lp_investments('available')
    @coming_soon = Investment.get_lp_investments('coming_soon')
    @past = Investment.get_lp_investments('past')
    @funded = Investment.get_lp_investments('funded')
    @testing = Investment.get_lp_investments('test_the_waters')
  end

  def show
    # TODO: We should probably figure out a better way. Getting warning of too many instance variables.
    @investment = Investment.find(params[:id])
    @progress_amount = @investment.get_progress_stats
    @vote = Vote.new.get_vote_count_by_investment(@investment.id)
  end


  def invest
    @investment = Investment.find(params[:id])#.get_investment_details(params[:id])
    @quote = @investment.quotes.new
  end

  def investment_confirmation
    @confirmation = Investment.find(params[:id])
  end

end