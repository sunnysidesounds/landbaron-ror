class InvestmentController < ApplicationController

  def index
  end

  def investment
    investments = Investment.new
    @available = investments.get_lp_investments('available')
    @coming_soon = investments.get_lp_investments('coming_soon')
    @past = investments.get_lp_investments('past')
  end

  def investment_detail
    if params[:id]
      investments = Investment.new
      medium = Medium.new
      principle_investors = PrincipleInvestor.new
      @media = medium.get_all_investment_media(params[:id])
      @document_count = medium.get_document_count_by_id(params[:id])
      @details = investments.get_a_investment_detail(params[:id])
      @principles = principle_investors.get_principal_investors(params[:id])
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