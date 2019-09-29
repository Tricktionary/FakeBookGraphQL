module Resolvers
    class GetSong < Resolvers::BaseResolver
        type Types::SongType, null: false

        argument :id, Integer, required: true

        def resolve(id:)
            song = Song.find(id)
            song
        end
    end
end