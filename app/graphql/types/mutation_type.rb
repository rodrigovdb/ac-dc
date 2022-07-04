# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :album_create, mutation: Mutations::AlbumCreate
    field :album_update, mutation: Mutations::AlbumUpdate
    field :album_delete, mutation: Mutations::AlbumDelete
  end
end
