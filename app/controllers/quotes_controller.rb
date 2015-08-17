class QuotesController < ApplicationController

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to :controller => 'investments', :action => 'investment_confirmation', :id => @quote.investment_id
    else
      flash[:error] = @quote.errors.full_messages.join("<br>").html_safe
      @investment = @quote.investment
    end
  end

  private

  def quote_params
    # params[:quote][:total_amount].gsub!('$','').gsub!(',', '')
    params.require(:quote).permit(:investment_id, :reference_id, :user_id, :total_amount, :investor_profile_type, :status, :payment_methd)
  end


end
