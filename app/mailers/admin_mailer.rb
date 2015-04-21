class AdminMailer < ApplicationMailer
  default :from => Settings.from_email

  def admin_email(current_user, quote_user = nil)
    @user = current_user
    if quote_user != nil
      @quote = quote_user
      investments = Investment.new
      @investment = investments.get_a_investment_detail(@quote.investment_id)
    end
    mail(:to => Settings.admin_group_email , :subject => Settings.admin_email_subject)
  end

end