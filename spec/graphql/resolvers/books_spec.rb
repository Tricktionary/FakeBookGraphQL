
# frozen_string_literal: true

require 'rails_helper'

describe Resolvers::Books do
  let(:resolver) { Resolvers::Books.new(object: nil, context: {}) }

  describe 'Testing resolver' do

    context 'Search for book named `test`' do
      let!(:book_a) { create(:book, book_title: 'testA') }
      let!(:book_b) { create(:book, book_title: 'testB') }
      
      it 'and find 2 bool that exist' do
        result = resolver.resolve(title:'test')
        expect(result.count).to be(2)
      end
    end 
  end
end 
  