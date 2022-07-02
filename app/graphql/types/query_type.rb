# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :artists, [Types::ArtistType], description: "A list of artists"
    field :artist,  Types::ArtistType, description: "Retrieve an artist" do
      argument :id, ID
    end

    field :items, [Types::ItemType], description: "A list of items"
    field :item, Types::ItemType, description: "Retrieves an item" do
      argument :id, ID
    end

    def artist(id:)
      Artist.find(id)
    end

    def item(id:)
      Item.find(id)
    end

    def artists
      Artist.all
    end

    def items
      Item.all
    end
  end
end
