# frozen_string_literal: true

require 'rails_helper'

describe Resolvers::Songs do
  let(:resolver) { Resolvers::Songs.new(object: nil, context: {}) }

  describe 'Testing resolver' do
    context 'Search for song named `test`' do
      let!(:song_a) { create(:song, name: 'testA') }
      let!(:song_b) { create(:song, name: 'testB') }

      it 'and find 2 songs that exist with fuzy search' do
        result = resolver.resolve(name: 'test')
        expect(result.count).to be(2)
      end
    end
  end
end
