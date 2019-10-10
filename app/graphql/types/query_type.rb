# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :songs,
          resolver: Resolvers::Songs,
          description: 'Retrieve all songs'

    field :books,
          resolver: Resolvers::Books,
          description: 'retrieve all books'

    field :get_book,
          resolver: Resolvers::GetBook,
          description: 'Get book'

    field :get_song,
          resolver: Resolvers::GetSong,
          description: 'Get song'

    field :search_song_by_page,
          resolver: Resolvers::SearchSongByPage,
          description: 'Search for a song by its book and page'
  end
end
