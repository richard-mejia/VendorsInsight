# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
# Don't care if the mailer can't send.
 
config = Propiedad.first
 ActionMailer::Base.smtp_settings = {
  :user_name => config.id_correo,
  :password => config.pass_correo,
     :domain => 'vendorinsight.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
