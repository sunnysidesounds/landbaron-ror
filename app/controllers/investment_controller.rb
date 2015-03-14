class InvestmentController < ApplicationController

  def index



  end

  def investment
    @investments = Investment.new
    @available = @investments.get_landing_page_investments('available')
    @coming_soon = @investments.get_landing_page_investments('coming_soon')
    @past = @investments.get_landing_page_investments('past')
  end

  def investment_detail
    if params[:id]
      @foobar = "MASTER FUCKER " + params[:id]
    end




    end



end