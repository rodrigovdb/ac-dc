# frozen_string_literal: true

module Resolvers
  class Artist < BaseResolver
    type Types::ArtistType, null: false

    argument :id, ID, required: false, description: 'Artist id'

    def resolve(id: nil)
      ::Artist.find(id)
    end
  end
end
