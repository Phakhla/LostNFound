# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@lostnfound.com" }
    password { 'password' }
    sequence(:username) { |n| "user_#{n}" }
    sequence(:tel) { |n| "+6600000000#{n}" }
    after(:create, &:confirm)
  end

  factory :post do
    name { 'postname' }
    category { 'found_item' }
    status { 'active' }
    date { Time.zone.now }
    time { Time.zone.now }
    lat { 18.804668 }
    lng { 98.955033 }
    detail { 'detailname' }
    images { [Rack::Test::UploadedFile.new('spec/fixtures/files/user-icon.png')] }
    association :user
    association :type
  end

  factory :comment do
    content { 'comment message' }
    association :user
    association :post
  end

  factory :type do
    type_name { 'typename' }
  end
end
