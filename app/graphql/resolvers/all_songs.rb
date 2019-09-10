module Resolvers
    class AllSongs < Resolvers::BaseResolver
        type [Types::SongType], null: false

        def resolve
            Song.all
        end
    end
end