# frozen_string_literal: true

module Mutations
  class AlbumUpdate < BaseMutation
    description 'Updates a album by id'

    type Types::AlbumType
    null true

    argument :id, ID, required: true
    argument :name, String, required: true
    argument :year, Int, required: true
    argument :cover_image, String, required: true

    def resolve(id:, **params)
      album = ::Album.find(id)
      unless album.update(**params)
        raise GraphQL::ExecutionError.new 'Error updating album',
                                          extensions: album.errors.to_hash
      end

      album
    end
  end
end
