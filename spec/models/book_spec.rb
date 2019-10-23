# frozen_string_literal: true

require 'rails_helper'

describe Book, type: :model do
  let(:book) { build(:book) }

  describe `valid?` do
    let(:result) { book.valid? }

    it 'valid book' do
      expect(result).to be(true)
    end

    context 'When book title is NIL' do
      before { book.title = nil }

      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'When two books have the same title' do
      let(:book_duplication) { create(:book, title: 'test') }

      before do
        book.title = book_duplication.title
      end

      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'When books has invalid page count' do      
      before do
        book.page_count = 0 
      end
      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'When books has valid page count' do      
      before do
        book.page_count = 10 
      end
      it 'returns true' do
        expect(result).to be(true)
      end
    end

  end
end
