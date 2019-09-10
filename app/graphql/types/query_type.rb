module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :all_songs,
      resolver: Resolvers::AllSongs,
      description: "An example field added by the generator"
  end
end
