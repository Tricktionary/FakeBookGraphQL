# frozen_string_literal: true

module Resolvers
  class GetBook < Resolvers::BaseResolver
    type Types::BookType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      Book.find(id)
    end
  end
end
