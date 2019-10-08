# frozen_string_literal: true

require 'rails_helper'

describe Song, type: :model do
  
  let(:song) { build(:song) }

  describe `valid` do 
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

    context 'when page end is before start' do
      before {
        song.page_range_start = 9
        song.page_range_end = 2
      }
      it 'returns false' do
        expect(result).to be(false)
      end
    end 

    context 'when page start is negative' do 
      before {
        song.page_range_start = -1
      }
      it 'returns false' do
        expect(result).to be(false)
      end
    end

  end 
end 