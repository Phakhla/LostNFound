# frozen_string_literal: true

SimpleCov.start 'rails' do
  add_filter [
    'app/mailers/application_mailer.rb',
    'app/jobs/application_job.rb',
    'app/channels/application_cable/connection.rb',
    'app/channels/application_cable/channel.rb',
    'app/controllers/places_controller.rb',
    'app/models/place.rb'
  ]
end

SimpleCov.at_exit do
  SimpleCov.result.format!
  SimpleCov.minimum_coverage 90
end
