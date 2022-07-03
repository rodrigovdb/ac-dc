# frozen_string_literal: true

module Resolvers
  class Artists < BaseResolver
    type [Types::ArtistType], null: false

    def resolve
      ::Artist.all.order(:id)
    end
  end
end
