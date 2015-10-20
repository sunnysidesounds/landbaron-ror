class AdminMailer < ApplicationMailer
  default :from => Settings.from_email

  def admin_email(current_user, quote = nil)
    @user = current_user
    if quote != nil
      @quote = quote
      investments = Investment.new
      @investment = investments.get_a_investment_detail(@quote.investment_id)
    end
    mail(:to => ENV["ADMINS_EMAILS"] , :subject => Settings.admin_email_subject)
  end

  def account_creation_email(user)
    @user = user
    mail(to: ENV["ADMINS_EMAILS"], subject: Settings.admin_email_subject)
  end

end