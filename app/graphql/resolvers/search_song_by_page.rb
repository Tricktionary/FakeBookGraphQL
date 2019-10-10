# frozen_string_literal: true

module Resolvers
  class SearchSongByPage < Resolvers::BaseResolver
    type [Types::SongType], null: false

    argument :book_title, String, required: true
    argument :page_number, Integer, required: true

    def resolve(book_title:, page_number:)
      if book_title.present?

        # Fuzzy search for the book title
        book = Book.where('book_title like ?', "%#{book_title}%")
        if book.present?

          songs = Song.where(book: book)

          result = []
          # Brute force search for range

          songs.each do |song|
            range_start = song.page_range_start
            range_end = song.page_range_end

            range = (range_start..range_end).to_a

            result.append(song) if range.include? page_number
          end
          if !result.empty?
            result
          else
            raise GraphQL::ExecutionError, 'This song does not exist'
          end

        else
          raise GraphQL::ExecutionError, 'This book does not exist'
        end
      else
        raise GraphQL::ExecutionError, 'This book is not valid'
      end
    end
  end
end
