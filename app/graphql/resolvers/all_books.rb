module Resolvers
    class AllBooks < Resolvers::BaseResolver
        type Types::BookType.connection_type, null: false
        def resolve
            Book.all
        end
    end
end