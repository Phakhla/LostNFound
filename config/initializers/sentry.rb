# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = Figaro.env.SENTRY_DSN
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  config.traces_sample_rate = 1.0

  config.enabled_environments = %w[production staging]
end
