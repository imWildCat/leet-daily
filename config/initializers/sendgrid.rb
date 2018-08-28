Rails.application.configure do
  ActionMailer::Base.smtp_settings = {
      :user_name => Rails.application.credentials[:sendgrid_username],
      :password => Rails.application.credentials[:sendgrid_password],
      :domain => 'leetdaily.com',
      :address => 'smtp.sendgrid.net',
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
  }
end