# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    artist
    name { Faker::Music.album }
    cover_image { Faker::Internet.url(path: '/cover.jpg') }
  end
end
