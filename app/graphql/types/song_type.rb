# Types::SongType = GraphQL::ObjectType.define do

#     name 'Song'
  
#     field :id , !types.ID
#     field :song_name, !types.String
#     field :page_range_start, !types.Integer
#     field :page_range_end, !types.Integer
#     field :page_count, !types.Integer
# end 

module Types
    class SongType < Types::BaseObject
        field :id, ID, null: false
        field :song_name, String, null: false
    end
end