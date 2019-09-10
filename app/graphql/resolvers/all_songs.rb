# class Resolvers::AllSongs < GraphQL::Function
  
#     description "Retrieve all songs with an available\n"

#     type types[Types::SongType]

#     def call(_obj, args, _ctx)
#         Song.all 
#     end
# end

module Resolvers
    class AllSongs < Resolvers::BaseResolver
        type [Types::SongType], null: false

        def resolve
            Song.all
        end
    end
end