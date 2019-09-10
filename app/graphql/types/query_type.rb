module Types
  class QueryType < Types::BaseObject
    field :all_songs,
      resolver: Resolvers::AllSongs,
      description: "An example field added by the generator"
  end
end
