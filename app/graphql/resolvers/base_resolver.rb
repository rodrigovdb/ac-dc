# frozen_string_literal: true

# See https://graphql-ruby.org/fields/resolvers.html#when-do-you-really-need-a-resolver
module Resolvers
  class BaseResolver < GraphQL::Schema::Resolver
    argument_class Types::BaseArgument
  end
end
