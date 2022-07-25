# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { 'rapadura' }

    trait :with_token do
      after :build do |user|
        user.authorization_token = Digest::MD5.hexdigest(Faker::Name.name)
        user.authorization_token_generated_at = DateTime.current - 30.minutes
      end
    end

    trait :with_expired_token do
      after :build do |user|
        user.authorization_token = Digest::MD5.hexdigest(Faker::Name.name)
        user.authorization_token_generated_at = DateTime.current - 61.minutes
      end
    end
  end
end
