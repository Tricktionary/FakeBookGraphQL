# frozen_string_literal: true

require 'rails_helper'

describe Resolvers::Songs do
  let(:resolver) { Resolvers::Songs.new(object: nil, context: {}) }

  describe 'resolve' do

    context 'create 2 songs with name `test*` and song named anything' do
      let!(:song_a) { create(:song, name: 'testA') }
      let!(:song_b) { create(:song, name: 'testB') }
      let!(:song_c) { create(:song, name: 'bruh') }

      it 'find 2 songs that exist with fuzzy search `test`' do
        result = resolver.resolve(name: 'test')
        expect(result.count).to be(2)
      end

      it 'find 0 songs that exist with searching "car"' do 
        result = resolver.resolve(name: 'car')
        expect(result.count).to be(0)
      end

      it 'find 3 songs when no param is passed in' do 
        result = resolver.resolve()
        expect(result.count).to be(3)
      end 
    end

    context 'no songs exist' do 

      it 'search for song with param' do 
        result = resolver.resolve(name: 'test')
        expect(result.count).to be(0)
      end 

      it 'search for song without param' do 
        result = resolver.resolve()
        expect(result.count).to be(0)
      end 

    end 
  end
end
