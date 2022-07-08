# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    name { Faker::Music.album }
    year { [1950..2020].sample }
    cover_image { Faker::Internet.url(path: '/cover.jpg') }
  end
end
