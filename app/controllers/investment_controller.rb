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
      # TODO: If we start using reference_id
      @reference_id = "uid#{current_user.id}ln#{current_user.last_name}iid#{params[:id]}"
    end
  end

  def investment_confirmation
    if params[:id]
      investments = Investment.new
      @confirmation = investments.get_investment_details(params[:id])
    end
  end



  def create_quote
    @quote = Quote.new(quote_params)

    # Stoppped here need to see what to pass
    render :action => "new_quote"


  #  if quote_params[:user_id] == current_user.id
   #   flash.now[:error] = 'User match'
   # end




    end


  def quote_params
    params.require(:quote).permit(:reference_id, :user_id, :total_amount, :investor_profile_type, :status, :payment_methd)
  end


end