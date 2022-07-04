# frozen_string_literal: true

module Types
  class ArtistType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :full_name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :items, [Types::ItemType]
  end
end
