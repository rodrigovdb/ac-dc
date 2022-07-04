# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Artists do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation ArtistCreate($name: String!, $email: String){
        artistCreate(
          input: {
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
  let(:name) { Faker::Name.name }
  let(:email) { Faker::Internet.free_email(name: name) }
  let(:variables) do
    { name: name,
      email: email }
  end
  let(:context) { {} }

  context 'when params are valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'artistCreate' => including(
            'id' => kind_of(String),
            'name' => name,
            'email' => email
          )
        )
      )
    end

    it do
      expect { response }.to change { Artist.count }.by(1)
    end
  end

  context 'when params are invalid' do
    let(:existent_artist) { create(:artist) }
    let(:email) { existent_artist.email }

    it do
      expect(response.to_h).to include(
        'errors' => including(
          including(
            'message' => 'Error creating artist',
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
