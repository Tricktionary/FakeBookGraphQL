# frozen_string_literal: true

require 'rails_helper'

describe Mutations::UpdateSong do
  let(:resolver) { Mutations::UpdateSong.new(object: nil, context: {}) }

  describe 'mutation' do

    context 'Update song' do
      let!(:song_a) { create(:song, name: 'testA', page_range_end: 2, page_range_end: 10) }
      it 'name is changed' do  
        result = resolver.resolve(id:song_a.id ,name: 'Are you bored yet?')
        expect(result[:song].name).to eq('Are you bored yet?')
      end
      
      it 'has invalid name not changed' do  
        result = resolver.resolve(id:song_a.id ,name: '')
        expect(result[:song].name).to eq('testA')
      end
    end
  end
end
