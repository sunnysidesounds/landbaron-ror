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
      @media = medium.get_investment_media(params[:id])
      @details = investments.get_investment_details(params[:id])
      @principles = principle_investors.get_principle_investor_bios(params[:id])
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