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
  let(:variables) do
    Hash[
      id: artist.id,
      name: artist_attributes[:name],
      email: artist_attributes[:email]
    ]
  end
  let(:context) { Hash[] }
  let!(:artist) { create(:artist) }
  let(:artist_attributes) { attributes_for(:artist) }

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
