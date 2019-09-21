module Types
  class QueryType < Types::BaseObject
    field :all_songs,
      resolver: Resolvers::AllSongs,
      description: "Retrieve all songs"
    
    field :all_books,
      resolver: Resolvers::AllBooks,
      description: "retrieve all books"
  end
end
