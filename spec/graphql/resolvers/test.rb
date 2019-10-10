require 'rails_helper'

module Mutations
  module Books
    RSpec.describe UpdateBook, type: :request do
      describe 'resolve' do
        it 'updates a book' do
          book   = create(:book, title: 'Hero', publication_date: 1984, genre: 'Horror')
          author = create(:author)

          post '/graphql', params: { query: query(id: book.id, author_id: author.id) }

          expect(book.reload).to have_attributes(
            'author_id'        => author.id,
            'title'            => 'Tripwire',
            'publication_date' => 1999,
            'genre'            => 'Thriller',
          )
        end

        it 'returns a book' do
          book   = create(:book, title: 'Hero', publication_date: 1984, genre: 'Horror')
          author = create(:author)

          post '/graphql', params: { query: query(id: book.id, author_id: author.id) }

          json = JSON.parse(response.body)
          data = json['data']['updateBook']

          expect(data).to include(
            'id'              => book.id.to_s,
            'title'           => 'Tripwire',
            'publicationDate' => 1999,
            'genre'           => 'Thriller',
            'author'          => { 'id' => author.id.to_s }
          )
        end
      end

      def query(id:, author_id:)
        <<~GQL
          mutation {
            updateBook(
              id: #{id}
              authorId: #{author_id} 
              title: "Tripwire"
              publicationDate: 1999
              genre: Thriller
            ) {
              id
              title
              publicationDate
              genre
              author {
                id
              }
            }
          }
        GQL
      end
    end
  end
end