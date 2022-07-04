# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Artists do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation ArtistDelete($id: ID!){
        artistDelete(
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
  let!(:artist) { create(:artist) }
  let(:id) { artist.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'artistDelete' => including(
            'id' => kind_of(String)
          )
        )
      )
    end

    it do
      expect { response }.to change { Artist.count }.from(1).to(0)
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => including(
          'artistDelete' => nil
        ),
        'errors' => including(
          including(
            'message' => 'Artist not found'
          )
        )
      )
    end
  end
end
