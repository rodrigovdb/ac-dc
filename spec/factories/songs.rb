# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    album
    name { Faker::Music::RockBand.song }
  end
end
