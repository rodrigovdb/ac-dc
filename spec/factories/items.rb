# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    artist
    title { Faker::Movies::HitchhikersGuideToTheGalaxy.planet }
    description { Faker::Movies::HitchhikersGuideToTheGalaxy.quote }
    image_url { Faker::Internet.url(path: "/#{Faker::Internet.username}.html") }
  end
end
