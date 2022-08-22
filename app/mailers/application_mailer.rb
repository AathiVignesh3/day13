class ApplicationMailer < ActionMailer::Base
  # default from: "aathivignesh222@gmail.com"
  default from: Rails.application.credentials.email_username
  layout "mailer"
end
