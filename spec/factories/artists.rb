# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    name { Faker::Music.band }
    email { Faker::Internet.free_email(name: instance&.name&.parameterize) }
  end
end
