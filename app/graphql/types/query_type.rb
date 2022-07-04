# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :albums, resolver: Resolvers::Albums, description: 'A list of albums'
    field :album, resolver: Resolvers::Album, description: 'An album'
  end
end
