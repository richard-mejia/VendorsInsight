# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
# Don't care if the mailer can't send.
 # config.action_mailer.raise_delivery_errors = true

 ActionMailer::Base.smtp_settings = {
  :user_name => 'santivasquez',
  :password => 'santiago12345',
  :domain => 'heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}