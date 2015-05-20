class InvestmentController < ApplicationController

  def index
  end

  def investment
    investments = Investment.new
    @available = investments.get_lp_investments('available')
    @coming_soon = investments.get_lp_investments('coming_soon')
    @past = investments.get_lp_investments('past')
    @funded = investments.get_lp_investments('funded')
  end

  def investment_detail
    if params[:id]
      investments = Investment.new
      quote = Quote.new
      medium = Medium.new
      principle_investors = PrincipleInvestor.new
      @media = medium.get_all_investment_media(params[:id])
      @document_count = medium.get_document_count_by_id(params[:id])
      @details = investments.get_a_investment_detail(params[:id])
      @principles = principle_investors.get_principal_investors(params[:id])
      @stats = quote.get_progress_stats(params[:id])
      votes = Vote.new
      @vote = votes.get_vote_count_by_investment(params[:id])


    end

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