# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Artist do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      query Artist($id: ID)  {
        artist(id: $id) {
          id
          name
          email
          items {
            id
            title
            description
            imageUrl
          }
        }
      }
    QUERY
  end
  let(:context) { Hash[] }
  let(:variables) { { id: id } }
  let!(:artist) { create(:artist) }
  let(:id) { artist.id }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'artist' => including(
            'id' => artist.id.to_s,
            'name' => artist.name,
            'email' => artist.email
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
            'message' => 'Artist not found'
          )
        )
      )
    end
  end
end
