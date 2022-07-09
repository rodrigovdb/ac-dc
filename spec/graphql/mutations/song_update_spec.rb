# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SongUpdate do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation SongUpdate($id: ID!, $albumId: String!, $name: String!, $duration: String!){
        songUpdate(
          input: {
            id: $id,
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
  let(:variables) do
    { id: id.to_s,
      albumId: album.id.to_s,
      name: name,
      duration: duration }
  end
  let(:context) { {} }
  let(:album) { create(:album) }
  let(:song) { create(:song, album: album) }
  let(:name) { Faker::Music::RockBand.song }
  let(:duration) { '08:01' }
  let(:id) { song.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'songUpdate' => including(
            'id' => kind_of(String),
            'name' => name,
            'album' => including(
              'id' => album.id.to_s,
              'name' => album.name
            )
          )
        )
      )
    end

    it do
      expect { response }.to change { song.reload.name }.from(song.name).to(name)
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => including(
          'songUpdate' => nil
        ),
        'errors' => including(
          including(
            'message' => 'Song not found'
          )
        )
      )
    end
  end
end
