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
          description: 'Get book'

    field :get_song,
          resolver: Resolvers::GetSong,
          description: 'Get song'

    field :search,
          resolver: Resolvers::Search,
          description: 'Search Based on title'

    field :search_book,
          resolver: Resolvers::SearchBook,
          description: 'Search for specific page in book'
  end
end
