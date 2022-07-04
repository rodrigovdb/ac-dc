# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Artists do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation ArtistUpdate($id: ID!, $name: String!, $email: String){
        artistUpdate(
          input: {
            id: $id,
            name: $name,
            email: $email
          }
        ) {
          id
          name
          email
        }
      }
    QUERY
  end
  let(:variables) do
    Hash[
      id: artist.id,
      name: name,
      email: email 
    ]
  end
  let(:context) { Hash[] }
  let(:artist) { create(:artist) }
  let(:artist_attributes) { attributes_for(:artist) }
  let(:name) { artist_attributes[:name] }
  let(:email) { artist_attributes[:email] }

  it do
    expect(response.to_h).to include(
      'data' => including(
        'artistUpdate' => including(
          'id' => kind_of(String),
          'name' => name,
          'email' => email
        )
      )
    )
  end

  it do
    expect { response }.to change { artist.reload.name }.from(artist.name).to(name)
      .and change { artist.reload.email }.from(artist.email).to(email)
  end
end
