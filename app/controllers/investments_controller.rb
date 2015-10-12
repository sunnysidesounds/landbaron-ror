class InvestmentsController < ApplicationController
  # before_filter :authenticate_user

  def index
    if(params.has_key? :status)
      if params[:status] == 'available'
        @investments = Investment.where(status: params[:status])
      elsif params[:status] == 'funded'
        @funded = Investment.where(status: params[:status])
      end
    end
    @investments ||= Investment.get_lp_investments('available')
    @total_investments = Investment.where(status: 'available').count
    @coming_soon ||= Investment.get_lp_investments('coming_soon')
    @past ||= Investment.get_lp_investments('past')
    @funded ||= Investment.get_lp_investments('funded')
    @water_testing ||= Investment.get_lp_investments('test_the_waters')
  end

  def show
    # TODO: We should probably figure out a better way. Getting warning of too many instance variables.
    @investment = Investment.find(params[:id])
    @progress_amount = @investment.get_progress_stats
    @vote = Vote.new.get_vote_count_by_investment(@investment.id)
  end

  def user_investments
    @quotes = current_user.quotes
    @active_quotes = current_user.quotes.accepted
    @pending_quotes = current_user.quotes.pending
    # @documents = Medium.where(investment_id: current_user.investments.all.map(&:id))    
  end

  def invest
    @investment = Investment.find(params[:id])#.get_investment_details(params[:id])
    @quote = @investment.quotes.new
  end

  def investment_confirmation
    @confirmation = Investment.find(params[:id])
  end

end