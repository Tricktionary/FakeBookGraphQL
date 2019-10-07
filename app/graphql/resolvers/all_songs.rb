module Resolvers
    class AllSongs < Resolvers::BaseResolver
        type Types::SongType.connection_type, null: false
        def resolve
            Song.all
        end
    end
end