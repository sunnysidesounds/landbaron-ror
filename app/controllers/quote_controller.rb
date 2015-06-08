class QuoteController < ApplicationController

  def index
  end

  def create_quote
    @quote = Quote.new(quote_params)
    if @quote.valid?
      @quote.save

      # Send Email
      ConfirmationMailer.confirmation_email(current_user, @quote).deliver_now
      AdminMailer.admin_email(current_user, @quote).deliver_now

      redirect_to :controller => 'investments', :action => 'investment_confirmation', :id => @quote.investment_id
    else
      # Specific Message
      flash[:error] = @quote.errors.full_messages.join("<br>").html_safe
      #TODO Need to handle empty fields and duplicate records error handle.
      redirect_to :controller => 'investments', :action => 'investment_now', :id => @quote.investment_id
    end
  end

  def quote_params
    params.require(:quote).permit(:investment_id, :reference_id, :user_id, :total_amount, :investor_profile_type, :status, :payment_methd)
  end


end
