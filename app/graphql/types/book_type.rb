module Types
    class BookType < Types::BaseObject
        field :id, ID, null: false
        field :page_count, String, null: false
        field :book_title, String, null: false
        field :book_code, String, null: false
    end
end