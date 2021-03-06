source 'https://rubygems.org'
git_source(:github) {|repo| "https://github.com/#{repo}.git"}

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
gem 'hiredis'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Front-end
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'bootstrap', '~> 4.1.1'
gem 'material-sass', '~> 4.1.1'
gem 'material_icons'
gem 'simple_form'

gem 'pagy', '~> 0.12.0' # pagination

gem 'aws-sdk-s3', require: false

# email validation
gem 'email_address'

# i18n
gem 'rails-i18n', '~> 5.1'

# wechat support
# gem 'wechat'

# Dev and test
group :development, :test do
  gem 'simplecov'

  gem 'guard'
  gem 'guard-minitest'

  gem 'minitest-reporters'

  gem 'pry-rails'

  gem 'bullet' # N + 1 query check
end

# Deployment
group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rbenv', '~> 2.1', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-sidekiq'
end

gem 'sidekiq', '~> 5.2', '>= 5.2.1'
gem 'sidekiq-cron', '~> 1.0', '>= 1.0.4'

gem 'pundit'

gem 'active_scaffold'

# ES6 support
gem 'sprockets', '~> 4.0.0.beta8'

gem 'kaminari'
