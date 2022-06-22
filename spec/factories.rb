# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@lostnfound.com" }
    password { 'password' }
    sequence(:username) { |n| "user_#{n}" }
    sequence(:firstname) { |n| "user_#{n}" }
    lastname { 'lastname' }
    sequence(:tel) { |n| "+6600000000#{n}" }
  end

  factory :post do
    name { 'postname' }
    category { 'found_item' }
    types { 'other' }
    status { 'no_found' }
    date { Time.zone.now }
    time { Time.zone.now }
    lat { 10.00000 }
    lng { 10.00000 }
    detail { 'detailname' }
    images { [Rack::Test::UploadedFile.new('spec/fixtures/files/user-icon.png')] }
    association :user
  end

  factory :comment do
    content { 'comment message' }
    association :user
    association :post
  end
end
