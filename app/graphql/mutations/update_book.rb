# frozen_string_literal: true

module Mutations
  class UpdateBook < Mutations::BaseMutation
    argument :id, Integer, required: true
    argument :title, String, required: true

    field :book, Types::BookType, null: true

    def resolve(id:, title:)
      book = Book.find(id)
      if book && title.present?
        if Book.find_by(title: title).present?
          raise GraphQL::ExecutionError.new('Invalid title book already exist')
          return
        end 
        book.update(title: title)
        {
          book: book
        }
      else
        raise GraphQL::ExecutionError.new('Invalid values provided')
      end
    end
  end
end
