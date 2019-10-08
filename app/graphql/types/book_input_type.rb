# frozen_string_literal: true

module Types
  InputObjects::BookInputType = GraphQL::InputObjectType.define do
    name 'Book Input'
    description 'Properties for creating a user'

    input_field :book_name, String
    input_field :csv, Scalars::FileType
    input_field :pdf, Scalars::FileType
  end
end
