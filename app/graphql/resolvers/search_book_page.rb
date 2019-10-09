# frozen_string_literal: true

module Resolvers
  class SearchBookPage < Resolvers::BaseResolver
    type [Types::SongType], null: false

    argument :book_title, String, required: true
    argument :page_number, Integer, required: true

    def resolve(book_name:)
      
    end
  end
end
