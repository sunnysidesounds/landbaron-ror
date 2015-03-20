class ConfirmationMailer < ApplicationMailer
    default from: "james@landbaronclub.com"

    def confirmation_email(current_user)
        mail(to: current_user.email , subject: 'Land Baron Club Investment Confirmation')
    end
end
