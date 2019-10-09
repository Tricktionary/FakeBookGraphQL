module Resolvers
  class SearchBook < Resolvers::BaseResolver
    type [Types::BookType], null: false

    argument :title, String, required: true

    def resolve(title:)
      if title.present?
        Book.where("book_title like ?", "%#{title}%")
      else 
        []
      end
    end
  end
end
