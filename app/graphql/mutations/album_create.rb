# frozen_string_literal: true

module Mutations
  class AlbumCreate < BaseMutation
    description 'Creates a new album'

    type Types::AlbumType
    null true

    argument :name, String, required: true
    argument :cover_image, String, required: true

    def resolve(**params)
      album = ::Album.new(**params)
      raise GraphQL::ExecutionError.new 'Error creating album', extensions: album.errors.to_hash unless album.save

      album
    end
  end
end
