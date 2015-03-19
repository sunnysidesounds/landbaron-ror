class InvestmentController < ApplicationController

  def index
  end

  def investment
    investments = Investment.new
    @available = investments.get_landing_page_investments('available')
    @coming_soon = investments.get_landing_page_investments('coming_soon')
    @past = investments.get_landing_page_investments('past')
  end

  def investment_detail
    if params[:id]
      investments = Investment.new
      @details = investments.get_investment_details(params[:id])
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