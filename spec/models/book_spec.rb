# frozen_string_literal: true

require 'rails_helper'

describe Book, type: :model do
  let(:book) { build(:book) }

  describe `valid?` do
    let(:result) { book.valid? }

    it 'valid book' do
      expect(result).to be(true)
    end

    context 'when page count is negative' do
      before { book.page_count = -1 }

      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'When book title is NIL' do
      before { book.book_title = nil }

      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'When two books have the same title' do
      let(:book_duplication) { create(:book, book_title: 'test') }

      before do
        book.book_title = book_duplication.book_title
      end

      it 'returns false' do
        expect(result).to be(false)
      end
    end
  end
end
