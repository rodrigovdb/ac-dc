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
    { id: id,
      name: name,
      email: email }
  end
  let(:context) { {} }
  let(:artist) { create(:artist) }
  let(:artist_attributes) { attributes_for(:artist) }
  let(:id) { artist.id }
  let(:name) { artist_attributes[:name] }
  let(:email) { artist_attributes[:email] }

  context 'when id is valid' do
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
                                                          .and change {
                                                                 artist.reload.email
                                                               }.from(artist.email).to(email)
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => including(
          'artistUpdate' => nil
        ),
        'errors' => including(
          including(
            'message' => 'Artist not found'
          )
        )
      )
    end
  end

  context 'when params are invalid' do
    let(:existent_artist) { create(:artist) }
    let(:email) { existent_artist.email }

    it do
      expect(response.to_h).to include(
        'errors' => including(
          including(
            'message' => 'Error updating artist',
            'extensions' => including(
              'email' => including(
                'has already been taken'
              )
            )
          )
        )
      )
    end
  end
end
