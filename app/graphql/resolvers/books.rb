# frozen_string_literal: true

module Resolvers
  class Books < Resolvers::BaseResolver
    type Types::BookType.connection_type, null: false

    argument :title, String, required: false

    def resolve(title: nil)
      if title.present?
        Book.where('title like ?', "%#{title}%")
      else
        Book.all
      end
    end
  end
end
