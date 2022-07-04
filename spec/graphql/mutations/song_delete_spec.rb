# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SongDelete do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation SongDelete($id: ID!){
        songDelete(
          input: {
            id: $id
          }
        ) {
          id
        }
      }
    QUERY
  end
  let(:variables) { { id: id } }
  let(:context) { {} }
  let!(:song) { create(:song) }
  let(:id) { song.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'songDelete' => including(
            'id' => kind_of(String)
          )
        )
      )
    end

    it do
      expect { response }.to change { Song.count }.from(1).to(0)
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => including(
          'songDelete' => nil
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
