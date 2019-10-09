# frozen_string_literal: true

require 'rails_helper'

describe Song, type: :model do
  let(:song) { build(:song) }

  describe `valid?` do
    let(:result) { song.valid? }

    it 'valid song' do
      expect(result).to be(true)
    end

    context 'when song has no name' do
      before { song.name = nil }

      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'when song page_range_end is before page_range_start' do
      before do
        song.page_range_start = 9
        song.page_range_end = 2
      end
      it 'returns false' do
        expect(result).to be(false)
      end
    end

    context 'when song page_range_start is negative' do
      before do
        song.page_range_start = -1
      end
      it 'returns false' do
        expect(result).to be(false)
      end
    end
  end
end
