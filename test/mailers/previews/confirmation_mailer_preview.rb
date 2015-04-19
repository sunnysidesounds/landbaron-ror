class ConfirmationMailerPreview < ActionMailer::Preview
  def confirmation_mail_preview
    ConfirmationMailer.confirmation_email(User.first)
  end
end