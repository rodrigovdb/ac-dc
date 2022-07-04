# frozen_string_literal: true

module Mutations
  class SongDelete < BaseMutation
    description 'Deletes a song by ID'

    type Types::SongType
    null true

    argument :id, ID, required: true

    def resolve(id:)
      song = ::Song.find(id)
      raise GraphQL::ExecutionError.new 'Error deleting song', extensions: song.errors.to_hash unless song.destroy

      song
    end
  end
end
