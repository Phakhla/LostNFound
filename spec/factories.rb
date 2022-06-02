# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@lostnfound.com" }
    sequence(:username) { |n| "user_#{n}" }
    sequence(:firstname) { |n| "user_#{n}" }
    lastname { 'lastname' }
    sequence(:tel) { |n| "+6600000000#{n}" }
  end
end
