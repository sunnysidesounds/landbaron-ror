class ConfirmationMailer < ApplicationMailer
    default from: "james@landbaronclub.com"

    def confirmation_email(user, quote)
        @user = user
        @quote = quote
        mail(to: @user.email, subject: 'Land Baron Club Investment Confirmation')
    end
end
