# frozen_string_literal: true

return if Rails.env.test?

keys = %w[EMAIL_FROM MAPS_API_KEY]

unless Rails.env.development?
  keys += %w[
    DOMAIN HOST AWS_KEY AWS_ACCESS_KEY SENDGRID_USERNAME SENDGRID_API_KEY SENTRY_DSN
  ]
end

Figaro.require_keys(keys)
