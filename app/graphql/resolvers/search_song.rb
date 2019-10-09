# frozen_string_literal: true

module Resolvers
  class SearchSong < Resolvers::BaseResolver
    type [Types::SongType], null: false

    argument :name, String, required: true

    def resolve(name:)
      if name.present?
        Song.where("name like ?", "%#{name}%")
      else
        []
      end 
    end
  end
end
