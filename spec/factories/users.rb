# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.free_email }
    password { 'rapadura' }
  end
end
