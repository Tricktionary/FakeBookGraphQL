# frozen_string_literal: true

class FakeBookGraphQLSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
