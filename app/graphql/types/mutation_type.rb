# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :artist_create, mutation: Mutations::ArtistCreate
    field :artist_update, mutation: Mutations::ArtistUpdate
    field :artist_delete, mutation: Mutations::ArtistDelete
  end
end
