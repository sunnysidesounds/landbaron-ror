class ConfirmationMailer < ApplicationMailer
    default :from => Settings.default_email_admin_send

    def confirmation_email(current_user)
        mail(:to => current_user.email , :subject => 'Land Baron Club Investment Confirmation')
    end
end
