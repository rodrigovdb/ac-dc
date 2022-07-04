# frozen_string_literal: true

module Mutations
  class SongUpdate < BaseMutation
    description 'Updates a song by id'

    type Types::SongType
    null true

    argument :id, ID, required: true
    argument :album_id, String, required: true
    argument :name, String, required: true

    def resolve(id:, **params)
      song = ::Song.find(id)
      unless song.update(params)
        raise GraphQL::ExecutionError.new 'Error updating song',
                                          extensions: song.errors.to_hash
      end

      song
    end
  end
end
