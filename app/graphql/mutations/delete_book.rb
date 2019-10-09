
module Mutations
  class DeleteBook < Mutations::BaseMutation
    argument :id, Integer, required: true

    field :book, Types::BookType, null: true

    def resolve(id:)
      book = Book.destroy(id)
      {
        book: book
      }
    end
  end
end
