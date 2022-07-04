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
    Hash[
      name: name,
      email: email
    ]
  end
  let(:context) { Hash[] }

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
