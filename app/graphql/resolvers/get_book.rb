module Resolvers
    class GetBook < Resolvers::BaseResolver
        type Types::BookType, null: false

        argument :id, Integer, required: true

        def resolve(id:)
            book = Book.find(id)
            return book
        end
    end
end