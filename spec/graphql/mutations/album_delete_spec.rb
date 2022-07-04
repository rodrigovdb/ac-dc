# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Albums do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation AlbumDelete($id: ID!){
        albumDelete(
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
  let!(:album) { create(:album) }
  let(:id) { album.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'albumDelete' => including(
            'id' => kind_of(String)
          )
        )
      )
    end

    it do
      expect { response }.to change { Album.count }.from(1).to(0)
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => including(
          'albumDelete' => nil
        ),
        'errors' => including(
          including(
            'message' => 'Album not found'
          )
        )
      )
    end
  end
end
