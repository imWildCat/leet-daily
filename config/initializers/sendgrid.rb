Rails.application.configure do
  config.action_mailer.delivery_method = :sendgrid_actionmailer
  config.action_mailer.sendgrid_actionmailer_settings = {
      api_key: Rails.application.credentials[:sendgrid_api_key],
      raise_delivery_errors: true
  }
end