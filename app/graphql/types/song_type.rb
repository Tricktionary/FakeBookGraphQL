# frozen_string_literal: true

module Types
  class SongType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :page_range_start, Integer, null: false
    field :page_range_end, Integer, null: false
    field :pdf_url, String, null: false
    field :book, BookType, null: false
  end
end
