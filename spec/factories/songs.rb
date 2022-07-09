# frozen_string_literal: true

FactoryBot.define do
  factory :song do
    album
    name { Faker::Music::RockBand.song }
    duration { "#{(1..7).to_a.sample}:#{(10..59).to_a.sample}" }
  end
end
