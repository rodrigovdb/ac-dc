# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :song_delete, mutation: Mutations::SongDelete
    field :song_update, mutation: Mutations::SongUpdate
    field :song_create, mutation: Mutations::SongCreate
    field :album_create, mutation: Mutations::AlbumCreate
    field :album_update, mutation: Mutations::AlbumUpdate
    field :album_delete, mutation: Mutations::AlbumDelete
  end
end
