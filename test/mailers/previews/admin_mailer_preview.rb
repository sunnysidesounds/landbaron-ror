class AdminMailerPreview < ActionMailer::Preview

  def admin_mail_preview
    AdminMailer.admin_email(User.first, Quote.first)
  end


end