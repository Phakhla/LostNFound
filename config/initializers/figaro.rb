# frozen_string_literal: true

return if Rails.env.test?

Figaro.require_keys('MAPS_API_KEY')
