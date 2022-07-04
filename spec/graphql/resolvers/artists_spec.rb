# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Artists do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      {
        artists {
          id
          name
          email
        }
      }
    QUERY
  end
  let(:context) { {} }
  let(:variables) { {} }
  let!(:artists) { create_list(:artist, 10) }

  it do
    expect(response.to_h).to include(
      'data' => including(
        'artists' => artists.map do |artist|
          { 'id' => artist.id.to_s,
            'name' => artist.name,
            'email' => artist.email }
        end
      )
    )
  end
end
