# frozen_string_literal: true

module Resolvers
  class GetBook < Resolvers::BaseResolver
    type Types::BookType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      book = Book.find(id)

      book || GraphQL::ExecutionError.new('This book does not exist ')
    end
  end
end
