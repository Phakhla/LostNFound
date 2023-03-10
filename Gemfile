source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Bundle and process JS and CSS
gem "jsbundling-rails"
gem "cssbundling-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

gem 'devise'

# rails admin
gem 'rails_admin', '~> 3.0'
gem 'sassc-rails'

# Use Amazon S3
gem "aws-sdk-s3", require: false

gem "mini_magick", "~> 4.11"

gem "chunky_png", "~> 1.4"

gem "prawn", "~> 2.4"

gem "prawn-table", "~> 0.2.2"

# PDF generation plugin
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

gem "rqrcode", "~> 2.1"

gem "open-uri", "~> 0.2.0"

gem 'active_storage_validations'

gem 'simple_form'

# For search & sorting
gem 'ransack'

# Set environment variables
gem 'figaro'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator
gem 'kaminari'

# Notification
gem "noticed"

# Production email service
gem 'sendgrid-ruby'

# Error tracking
gem "sentry-ruby"
gem "sentry-rails"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  gem 'rspec-rails', '~> 6.0.0.rc1'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'capistrano', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-postgresql', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Ruby code style checker (linter) and formatter based on the community-driven
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false

  # Static analysis tool which checks Ruby on Rails applications for security vulnerabilities
  gem 'brakeman', require: false

  #Preview email in the default browser instead of sending it.
  gem "letter_opener"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

  gem 'factory_bot_rails'
  gem 'simplecov', require: false
  gem 'rspec_junit_formatter', '~> 0.4.1'
end

gem "matrix", "~> 0.4.2"

