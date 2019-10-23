# frozen_string_literal: true

module Mutations
  class UpdateSong < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: false
    argument :page_range_start, Integer, required: false
    argument :page_range_end, Integer, required: false

    field :song, Types::SongType, null: true

    def resolve(id:, name:nil, page_range_start:nil, page_range_end:nil)
      song = Song.find(id)
      if song

        song.name = name if name.present?

        song.page_range_start = page_range_start if page_range_start.present?

        song.page_range_end = page_range_end if page_range_end.present?

        song.save

        {
          song: song
        }
      else
        raise GraphQL::ExecutionError.new('Song does not exist')
      end
    end
  end
end
