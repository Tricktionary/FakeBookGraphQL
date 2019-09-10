Types::BookType = GraphQL::ObjectType.define do

    name 'Book'
  
    field :id , !types.ID
    field :page_count, !types.Integer
    field :book_title, !types.String
    field :book_code, !types.String

  end 