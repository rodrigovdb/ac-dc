# frozen_string_literal: true

SimpleCov.start do
  add_group 'Models',               '/app/models/'
  add_group 'GraphQL :: Resolvers', '/app/graphql/resolvers/'
  add_group 'GraphQL :: Mutations', '/app/graphql/mutations/'

  add_filter '/app/controllers/graphql_controller.rb'
  add_filter '/app/graphql/rails_graphql_schema.rb'
  add_filter '/spec/'
  add_filter '/config/'
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter
]
