# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    picture { Faker::Avatar.image }
    email { Faker::Internet.email }
    provider { "FACEBOOK" }
    uid { "123456" }
  end
end
