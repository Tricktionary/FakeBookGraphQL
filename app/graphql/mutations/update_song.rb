# frozen_string_literal: true

module Mutations
  class UpdateSong < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :name, String, required: false , default_value: nil
    argument :page_range_start, Integer, required: false,  default_value: nil
    argument :page_range_end, Integer, required: false,  default_value: nil
  
    field :song, Types::SongType, null: true

    def resolve(id:,name:,page_range_start:,page_range_end:)
      song = Song.find(id)
      if song

        if name.present?
          song.name = name 
        end 

        if page_range_start.present?
          song.page_range_start = page_range_start
        end 

        if page_range_end.present?
          song.page_range_end = page_range_end
        end 

        song.save

        {
          song:song
        }
      else
        GraphQL::ExecutionError.new("Invalid values provided") 
      end 
    end
  end
end
