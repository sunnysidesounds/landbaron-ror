class AccountCreationMailerPreview < ActionMailer::Preview
  def account_creation_mail_preview
    AccountCreationMailer.account_creation_email(User.first)
  end
end