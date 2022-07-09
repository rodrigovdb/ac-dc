# frozen_string_literal: true

module Mutations
  class SongCreate < BaseMutation
    description 'Creates a new song'

    type Types::SongType

    argument :album_id, String, required: true
    argument :name, String, required: true
    argument :duration, String, required: true

    def resolve(**params)
      song = ::Song.new(params)
      raise GraphQL::ExecutionError.new 'Error creating song', extensions: song.errors.to_hash unless song.save

      song
    end
  end
end
