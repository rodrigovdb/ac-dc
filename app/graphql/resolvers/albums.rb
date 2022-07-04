# frozen_string_literal: true

module Resolvers
  class Albums < BaseResolver
    type [Types::AlbumType], null: false

    def resolve
      ::Album.all.order(:id)
    end
  end
end
