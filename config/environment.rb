# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => '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',
  :domain => 'fast-depths-56174.herokuapp.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
