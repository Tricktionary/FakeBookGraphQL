# frozen_string_literal: true

module Resolvers
  class SearchBook < Resolvers::BaseResolver
    type [Types::SongType], null: false

    argument :book_name, String, required: true
    argument :page_number, Integer, required: true

    def resolve(book_name:)
      Song.find(id)
    end
  end
end
