# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :artists, resolver: Resolvers::Artists, description: 'A list of artists'
    field :artist, resolver: Resolvers::Artist, description: 'An artist'
    field :item, resolver: Resolvers::Item, description: 'An item'
  end
end
