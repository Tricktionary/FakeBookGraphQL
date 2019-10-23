# frozen_string_literal: true

require 'rails_helper'

describe Mutations::UpdateBook do
  let(:resolver) { Mutations::UpdateBook.new(object: nil, context: {}) }

  describe 'mutation' do

    context 'Update book' do
      let!(:book_a) { create(:book, title: 'bookA') }
      let!(:book_b) { create(:book, title: 'bookB') }

      it 'name is changed' do  
        result = resolver.resolve(id: book_a.id ,title: 'The Pragmatic Programmer')
        expect(result[:book].title).to eq('The Pragmatic Programmer')
      end
    
    end
  end
end
