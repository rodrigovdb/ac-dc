# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::AlbumCreate do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation AlbumCreate($name: String!, $year: Int, $coverImage: String!){
        albumCreate(
          input: {
            name: $name,
            year: $year,
            coverImage: $coverImage
          }
        ) {
          id
          name
          year
          coverImage
        }
      }
    QUERY
  end
  let(:name) { Faker::Music.album }
  let(:year) { [1950..2020].sample }
  let(:cover_image) { Faker::Internet.url(path: '/cover.jpg') }
  let(:variables) do
    { name: name,
      coverImage: cover_image }
  end
  let(:context) { {} }

  it do
    expect(response.to_h).to include(
      'data' => including(
        'albumCreate' => including(
          'id' => kind_of(String),
          'name' => name,
          'year' => year,
          'coverImage' => cover_image
        )
      )
    )
  end

  it do
    expect { response }.to change { Album.count }.by(1)
  end
end
