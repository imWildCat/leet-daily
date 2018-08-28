require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LeetDaily
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.action_controller.perform_caching = true
    config.cache_store = :redis_cache_store, {:url => 'redis://localhost:6379/0'}

    ActionMailer::Base.smtp_settings = {
        :user_name => Rails.application.credentials[:sendgrid_username],
        :password => Rails.application.credentials[:sendgrid_password],
        :domain => Rails.application.credentials[:host],
        :address => 'smtp.sendgrid.net',
        :port => 587,
        :authentication => :plain,
        :enable_starttls_auto => true
    }

    config.active_job.queue_adapter = :sidekiq

    credential_host = Rails.application.credentials[:host]
    host = Rails.env.development? || !credential_host ? 'localhost' : credential_host
    Rails.application.routes.default_url_options[:host] = host
  end
end
