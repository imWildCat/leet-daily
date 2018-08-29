class ApplicationMailer < ActionMailer::Base
  default :from => "LeetDaily <#{Rails.application.credentials[:from_email]}>"
  layout 'mailer'
end
