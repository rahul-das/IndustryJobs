# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'yourdomain.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
