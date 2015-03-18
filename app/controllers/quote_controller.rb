class QuoteController < ApplicationController

  def index

  end


  def create_quote
    @quote = Quote.new(quote_params)
    if @quote.valid?

      @quote.save
      redirect_to :controller => 'investment', :action => 'investment_confirmation'
    else
      # Specific Message
      flash[:error] = @quote.errors.full_messages.join("<br>").html_safe

      #TODO Need to handle empty fields and duplicate records error handle.
      redirect_to :controller => 'investment', :action => 'investment_now', :id => @quote.investment_id
    end
  end


  def quote_params
    params.require(:quote).permit(:investment_id, :reference_id, :user_id, :total_amount, :investor_profile_type, :status, :payment_methd)
  end



end
