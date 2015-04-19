class ConfirmationMailer < ApplicationMailer
    default :from => Settings.from_email

    def confirmation_email(current_user)
        @user = current_user
        mail(:to => current_user.email , :subject => Settings.confirmation_email_subject)
    end
end
