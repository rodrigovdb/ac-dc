# frozen_string_literal: true

module Resolvers
  class Song < BaseResolver
    type Types::SongType, null: false

    argument :id, ID, required: false, description: 'Song id'

    def resolve(id: nil)
      ::Song.find(id)
    end
  end
end
