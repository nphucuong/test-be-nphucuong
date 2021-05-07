# frozen_string_literal: true

FactoryBot.define do
  factory :token do
    user
    token { SecureRandom.hex(12) }
  end
end
