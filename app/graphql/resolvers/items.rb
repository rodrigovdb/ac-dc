# frozen_string_literal: true

module Resolvers
  class Items < BaseResolver
    type [Types::ItemType], null: false

    def resolve
      ::Item.all.order(:id)
    end
  end
end

