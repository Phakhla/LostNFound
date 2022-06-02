# frozen_string_literal: true

SimpleCov.start 'rails'

SimpleCov.at_exit do
  SimpleCov.result.format!
  SimpleCov.minimum_coverage 90
end
