# frozen_string_literal: true

module Resolvers
  class GetBook < Resolvers::BaseResolver
    type Types::BookType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      book = Book.find_by(id: id)
      if book.present?
        book
      else 
        raise GraphQL::ExecutionError.new('This book does not exist ')
      end
    end 
  end 
end
