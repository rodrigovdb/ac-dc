# frozen_string_literal: true

FactoryBot.define do
  factory :artist do
    name { Faker::Name.name }
    email { Faker::Internet.free_email(name: instance&.name&.parameterize) }
  end
end
