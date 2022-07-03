# frozen_string_literal: true

module Mutations
  class ArtistDelete < BaseMutation
    description 'Deletes a artist by ID'

    type Types::ArtistType
    null true

    argument :id, ID, required: true

    def resolve(id:)
      artist = ::Artist.find(id)
      raise GraphQL::ExecutionError.new 'Error deleting artist', extensions: artist.errors.to_hash unless artist.destroy

      artist
    end
  end
end
