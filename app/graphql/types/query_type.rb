# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_songs,
      resolver: Resolvers::AllSongs,
      description: 'Retrieve all songs'

    field :all_books,
      resolver: Resolvers::AllBooks,
      description: 'retrieve all books'

    field :get_book,
      resolver: Resolvers::GetBook,
      description: 'Get book by id'

    field :get_song,
      resolver: Resolvers::GetSong,
      description: 'Get song by id'

    field :search_book,
      resolver: Resolvers::SearchBook,
      description: 'Search Based on book title'

    field :search_song,
      resolver: Resolvers::SearchSong,
      description: 'Search Based on song name'
  end
end
