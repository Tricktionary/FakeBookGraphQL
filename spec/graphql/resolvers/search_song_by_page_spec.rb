# frozen_string_literal: true

require 'rails_helper'

describe Resolvers::SearchSongByPage do
  let(:resolver) { Resolvers::SearchSongByPage.new(object: nil, context: {}) }

  describe 'Testing resolver' do
    context 'Search for a page in book' do
      let!(:book) { create(:book, title: 'testBook') }
      let!(:song_a) { create(:song, name: 'Sunday Morning', page_range_start: 10, page_range_end: 20, book: book) }
      let!(:song_b) { create(:song, name: 'Take on Me', page_range_start: 1, page_range_end: 9, book: book) }

      it 'Found the song' do
        result = resolver.resolve(title: 'test', page_number: 12)
        expect(result[0].name).to eq('Sunday Morning')
      end
    end
  end
end
