# frozen_string_literal: true

module Resolvers
  class Search < Resolvers::BaseResolver
    type [Types::SongType], null: false
    type [Types::BookType], null: false

    argument :name_search, String, required: true

    def resolve(name_search:)
      Song.find(id)
    end
  end
end
