# frozen_string_literal: true

Rails.application.routes.default_url_options[:host] = Figaro.env.HOST
