class ConfirmationMailer < ApplicationMailer
    default :from => Settings.from_email

    def confirmation_email(current_user, quote_user)
        @user = current_user
        @quote = quote_user

        investments = Investment.new
        @investment = investments.get_a_investment_detail(@quote.investment_id)

        mail(:to => current_user.email , :subject => Settings.confirmation_email_subject)
    end
end
