# frozen_string_literal: true

module Mutations
  class UpdateSong < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: false, default_value: nil
    argument :page_range_start, Integer, required: false, default_value: nil
    argument :page_range_end, Integer, required: false, default_value: nil

    field :song, Types::SongType, null: true

    def resolve(id:, name:, page_range_start:, page_range_end:)
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
        GraphQL::ExecutionError.new('Song does not exist')
      end
    end
  end
end
