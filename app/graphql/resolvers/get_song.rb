# frozen_string_literal: true

module Resolvers
  class GetSong < Resolvers::BaseResolver
    type Types::SongType, null: false

    argument :id, Integer, required: true

    def resolve(id:)
      song = Song.find_by(id:id)
      if song.present?
        song
      else
        raise GraphQL::ExecutionError, 'This song does not exist '
      end
    end
  end
end
