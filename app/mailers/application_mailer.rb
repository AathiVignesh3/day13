class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.email_username
  layout "mailer"
end
