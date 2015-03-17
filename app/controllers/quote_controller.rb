class QuoteController < ApplicationController

  def index

  end


  def create_quote
    @quote = Quote.new(quote_params)
    if @quote.valid?

      # TODO Check for duplicate records.
      @quote.save
      redirect_to :controller => 'investment', :action => 'investment_confirmation'
    else
      # Specific Message
      #flash[:error] = @quote.errors.full_messages.join("<br>").html_safe
      flash[:error] = 'All fields are required to make a investment!'
      redirect_to :controller => 'investment', :action => 'investment_now', :id => @quote.investment_id
    end


  end


  def quote_params
    params.require(:quote).permit(:investment_id, :reference_id, :user_id, :total_amount, :investor_profile_type, :status, :payment_methd)
  end



end
