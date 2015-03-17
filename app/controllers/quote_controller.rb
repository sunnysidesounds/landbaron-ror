class QuoteController < ApplicationController

  def index

  end


  def create_quote
    @quote = Quote.new(quote_params)

    if @quote.valid?
      @quote.save
      redirect_to :controller => 'investment', :action => 'investment_confirmation'
    else
      flash.now[:error] = 'All fields must be filled in!'
      #redirect_to :back

      redirect_to :controller => 'investment', :action => 'investment_confirmation'





    end


  end


  def quote_params
    params.require(:quote).permit(:investment_id, :reference_id, :user_id, :total_amount, :investor_profile_type, :status, :payment_methd)
  end



end
