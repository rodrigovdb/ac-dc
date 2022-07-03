# frozen_string_literal: true

module Resolvers
  class Item < BaseResolver
    type Types::ItemType, null: false

    argument :id, ID, required: false, description: 'Item id'

    def resolve(id: nil)
      ::Item.find(id)
    end
  end
end
