# frozen_string_literal: true

module Mutations
  class UploadFile < Mutations::BaseMutation
    argument :name, String, required: true
    argument :page_range_start, Integer, required: true
    argument :page_range_end, Integer, required: true
    argument :page_count, Integer, required: true

    field :song, Types::SongType, null: true

    def resolve(name:, page_range_start:, page_range_end:, page_count:)
      song = Song.create(name: name, page_range_start: page_range_start, page_range_end: page_range_end)
      {
        song: song
      }
    end
  end
end
