# frozen_string_literal: true

module Mutations
  class UpdateBook < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :book_title, String, required: true

    field :book, Types::BookType, null: true

    def resolve(id:, book_title:)
      book = Book.find(id)
      if book && book_title.present?
        book.update(book_title: book_title)
        {
          book: book
        }
      else
        GraphQL::ExecutionError.new('Invalid values provided')
      end
    end
  end
end
