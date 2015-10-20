ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => "587",
    :user_name => 'investor@landbaronclub.com',
    :password => 'L@ndB@ron2015',
    :authentication           => 'plain',
    :enable_starttls_auto     => true
}