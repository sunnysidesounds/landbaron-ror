class AccountCreationMailer < ApplicationMailer

  default :from => Settings.from_email

  def account_creation_email(current_user)
    @user = current_user
    mail(:to => current_user.email , :subject => Settings.account_creation_email_subject)
  end


end
