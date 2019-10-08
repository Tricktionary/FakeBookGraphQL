# frozen_string_literal: true

module Resolvers
  class GetSong < Resolvers::BaseResolver
    type Types::SongType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      Song.find(id)
    end
  end
end
