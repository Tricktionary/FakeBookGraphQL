module Resolvers
    class AllBooks < Resolvers::BaseResolver
        type [Types::BookType], null: false

        def resolve
            Book.all
        end
    end
end