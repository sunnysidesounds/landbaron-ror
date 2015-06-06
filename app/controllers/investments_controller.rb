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
      # quote = Quote.new
      # medium = Medium.new
      # principle_investors = PrincipleInvestor.new
      # @media = medium.get_all_investment_media(params[:id])
      # @document_count = Investment.medium.where(:media_item_content_type => 'application/pdf').count
      # @details = investments.get_a_investment_detail(params[:id])
      # @principles = principle_investors.get_principal_investors(params[:id])
      @stats = Quote.new.get_progress_stats(@investment.id)
      @vote = Vote.new.get_vote_count_by_investment(@investment.id)
  end


  def investment_now
    if params[:id]
      investments = Investment.new
      @invest_now = investments.get_investment_details(params[:id])
      @user = current_user
      @quote = Quote.new
    end
  end

  def investment_confirmation
    if params[:id]
      investments = Investment.new
      @confirmation = investments.get_investment_details(params[:id])
    end
  end

end