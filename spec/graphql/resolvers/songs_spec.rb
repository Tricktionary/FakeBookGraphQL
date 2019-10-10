# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resolvers::Songs do
  let(:resolver) { Resolvers::Songs.new(object: nil, context: {}) }

  describe 'Search for song' do
    let(:song_a) { create(:song, book_title: 'test') }
    let(:song_b) { create(:song, book_title: 'test') }
    
    it 'has an existing location' do
      result = resolver.resolve( name: "test" )
      
      byebug
      expect(result[:job_location].job_id).to eq(job.id)
      expect(result[:job_location].location_id).to eq(location.id)
      expect(result[:errors]).to be_empty
    end
  end
end 
  