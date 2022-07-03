# frozen_string_literal: true

module Mutations
  class ArtistUpdate < BaseMutation
    description 'Updates a artist by id'

    type Types::ArtistType
    null true

    argument :id, ID, required: true
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :email, String, required: true

    def resolve(id:, **params)
      artist = ::Artist.find(id)
      unless artist.update(params)
        raise GraphQL::ExecutionError.new 'Error updating artist',
                                          extensions: artist.errors.to_hash
      end

      artist
    end
  end
end
