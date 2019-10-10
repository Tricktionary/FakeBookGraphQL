# frozen_string_literal: true

require 'rails_helper'

module Resolvers
  describe Books, type: :request do
     
    describe 'books query integration' do 
      context 'create 2 books with name `test*` and book named anything' do 
        
        let!(:book_a) { create(:book, title: 'testA') }
        let!(:book_b) { create(:book, title: 'testB') }
        let!(:book_c) { create(:book, title: 'bruh') }

        it 'find 2 book that exist with fuzzy search for "test" ' do
          post '/graphql', params: { query: query(title: "test") }

          json = JSON.parse(response.body)
          data = json['data']['books']['nodes']
          expect(data.count).to be(2)
        end

        it 'find 0 book that exist with fuzzy search "car" ' do
          post '/graphql', params: { query: query(title: "car") }

          json = JSON.parse(response.body)
          data = json['data']['books']['nodes']
          expect(data.count).to be(0)
        end

        it 'find 3 books when no params are passed' do
          post '/graphql', params: { query: query() }

          json = JSON.parse(response.body)
          data = json['data']['books']['nodes']
          expect(data.count).to be(3)
        end

      end 
    end 

    def query(title:"")
      <<~GQL
        query{
            books(title:#{title}){
            nodes{
              id
              title
            }
          }
        }
      GQL
    end

  end  
end
 