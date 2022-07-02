# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :items, [Types::ItemType], null: false, description: "A list of items"
    field :artists, [Types::ArtistType], null: false, description: "A list of artists"

    def items
      Item.all
    end

    def artists
      Artist.all
    end
  end
end
