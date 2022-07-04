# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::AlbumUpdate do
  subject(:response) { RailsGraphqlSchema.execute(query, context: context, variables: variables) }

  let(:query) do
    <<-QUERY
      mutation AlbumUpdate($id: ID!, $name: String!, $coverImage: String!){
        albumUpdate(
          input: {
            id: $id,
            name: $name,
            coverImage: $coverImage
          }
        ) {
          id
          name
          coverImage
        }
      }
    QUERY
  end
  let(:variables) do
    { id: id,
      name: name,
      coverImage: cover_image }
  end
  let(:context) { {} }
  let(:album) { create(:album) }
  let(:album_attributes) { attributes_for(:album) }
  let(:id) { album.id }
  let(:name) { album_attributes[:name] }
  let(:cover_image) { album_attributes[:cover_image] }

  context 'when id is valid' do
    it do
      expect(response.to_h).to include(
        'data' => including(
          'albumUpdate' => including(
            'id' => kind_of(String),
            'name' => name,
            'coverImage' => cover_image
          )
        )
      )
    end

    it do
      expect { response }.to change { album.reload.name }.from(album.name).to(name)
                                                         .and change {
                                                                album.reload.cover_image
                                                              }.from(album.cover_image).to(cover_image)
    end
  end

  context 'when id is invalid' do
    let(:id) { 0 }

    it do
      expect(response.to_h).to include(
        'data' => including(
          'albumUpdate' => nil
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
