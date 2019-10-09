# frozen_string_literal: true

module Resolvers
  class GetBook < Resolvers::BaseResolver
    type Types::BookType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      book = Book.find(id)
     
      if book
        book
      else 
        GraphQL::ExecutionError.new("This book does not exist ")
      end 
      
    end
  end
end
