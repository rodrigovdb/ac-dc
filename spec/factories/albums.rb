# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    cover_image { Faker::Internet.url(path: '/cover.jpg') }
  end
end
