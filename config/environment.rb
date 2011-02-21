# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Hotels::Application.initialize!
Time::DATE_FORMATS[:default] = "%d/%m/%Y %l:%M%p"

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
  :address => 'mail.phyowaiwin.com',
  :port => 25,
  :domain => 'phyowaiwin.com',
  :authentication => :login,
  :user_name => 'sp@phyowaiwin.com',
  :password => 'warhawk'
  	}