# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Song do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      query Song($id: ID)  {
        song(id: $id) {
          id
          name
          sort
          album {
            id
            name
          }
        }
      }
    QUERY
  end
  let(:context) { {} }
  let(:variables) { { id: id } }
  let(:album) { create(:album) }
  let!(:song) { create(:song, album: album) }
  let(:id) { song.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'song' => including(
            'id' => song.id.to_s,
            'name' => song.name,
            'sort' => song.sort,
            'album' => including(
              'id' => album.id.to_s,
              'name' => album.name
            )
          )
        )
      )
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => nil,
        'errors' => including(
          including(
            'message' => 'Song not found'
          )
        )
      )
    end
  end
end
