# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Album do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      query Album($id: ID)  {
        album(id: $id) {
          id
          name
          coverImage
        }
      }
    QUERY
  end
  let(:context) { {} }
  let(:variables) { { id: id } }
  let!(:album) { create(:album) }
  let(:id) { album.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'album' => including(
            'id' => album.id.to_s,
            'name' => album.name,
            'coverImage' => album.cover_image
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
            'message' => 'Album not found'
          )
        )
      )
    end
  end
end
