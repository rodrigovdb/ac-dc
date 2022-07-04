# frozen_string_literal: true

module Types
  class AlbumType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :cover_image, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
