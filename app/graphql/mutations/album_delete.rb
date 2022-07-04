# frozen_string_literal: true

module Mutations
  class AlbumDelete < BaseMutation
    description 'Deletes a album by ID'

    type Types::AlbumType
    null true

    argument :id, ID, required: true

    def resolve(id:)
      album = ::Album.find(id)
      raise GraphQL::ExecutionError.new 'Error deleting album', extensions: album.errors.to_hash unless album.destroy

      album
    end
  end
end
