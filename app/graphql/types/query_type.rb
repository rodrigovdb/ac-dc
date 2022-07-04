# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :albums, resolver: Resolvers::Albums, description: 'A list of albums'
    field :album, resolver: Resolvers::Album, description: 'An album'
    field :song, resolver: Resolvers::Song, description: 'A song'
  end
end
