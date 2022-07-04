# frozen_string_literal: true

module Resolvers
  class Album < BaseResolver
    type Types::AlbumType, null: false

    argument :id, ID, required: false, description: 'Album id'

    def resolve(id: nil)
      ::Album.find(id)
    end
  end
end
