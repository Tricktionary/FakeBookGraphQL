module Types
  class QueryType < Types::BaseObject
    field :all_songs,
      resolver: Resolvers::AllSongs,
      description: "Retrieve all songs"
    
    field :all_books,
      resolver: Resolvers::AllBooks,
      description: "retrieve all books"
    
    field :get_book,
      resolver: Resolvers::GetBook,
      description: "Get book"

  end
end
