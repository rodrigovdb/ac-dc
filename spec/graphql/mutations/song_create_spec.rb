# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SongCreate do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation SongCreate($albumId: String!, $name: String!, $duration: String!){
        songCreate(
          input: {
            albumId: $albumId,
            name: $name,
            duration: $duration
          }
        ) {
          id
          name
          sort
          duration
          album {
            id
            name
          }
        }
      }
    QUERY
  end
  let(:album) { create(:album) }
  let(:name) { Faker::Music::RockBand.song }
  let(:duration) { '08:01' }
  let(:variables) do
    { albumId: album.id.to_s,
      name: name,
      duration: duration }
  end
  let(:context) { {} }

  it do
    expect(response.to_h).to include(
      'data' => including(
        'songCreate' => including(
          'id' => kind_of(String),
          'name' => name,
          'duration' => duration,
          'album' => including(
            'id' => album.id.to_s,
            'name' => album.name
          )
        )
      )
    )
  end

  it do
    expect { response }.to change { Song.count }.by(1)
  end
end
