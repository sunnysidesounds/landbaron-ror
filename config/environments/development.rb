LandBaron::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  config.action_mailer.perform_deliveries = true
  config.action_mailer.delivery_method = :smtp
  # SMTP settings for gmail
  config.action_mailer.smtp_settings = {
      :address                  => 'smtp.gmail.com',
      :port                     => 587,
      #:user_name                => ENV['GMAIL_USER'],
      #:password                 => ENV['GMAIL_PASS'],
      :user_name => 'investor@landbaronclub.com',
      :password => 'lbc2015z0e',
      :authentication           => 'plain',
      :enable_starttls_auto     => true
  }



  #:user_name => 'your_sendgrid_username',
  #    :password => 'your_sendgrid_password',
  #    :domain => 'yourdomain.com',
  #    :address => 'smtp.sendgrid.net',
  #    :port => 587,
  #    :authentication => :plain,
  #    :enable_starttls_auto => true
  #


  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  #DEPRECATED in Rails 4 ---> config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)

  #DEPRECATED in Rails 4 ---> config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true

  #Paperclip file upload
  Paperclip.options[:command_path] = "/usr/local/bin/"

end
