# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Albums do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      {
        albums {
          id
          name
          coverImage
        }
      }
    QUERY
  end
  let(:context) { {} }
  let(:variables) { {} }
  let!(:albums) { create_list(:album, 10) }

  it { expect(response.to_h).to include('data' => including('albums')) }

  it do
    ids = response.to_h.dig('data', 'albums').map { |item| item['id'] }

    expect(ids).to eq(albums.map(&:id).map(&:to_s))
  end

  it do
    names = response.to_h.dig('data', 'albums').map { |item| item['name'] }

    expect(names).to eq(albums.map(&:name))
  end

  it do
    cover_images = response.to_h.dig('data', 'albums').map { |item| item['coverImage'] }

    expect(cover_images).to eq(albums.map(&:cover_image))
  end
end
