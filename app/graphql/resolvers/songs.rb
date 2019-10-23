# frozen_string_literal: true

module Resolvers
  class Songs < Resolvers::BaseResolver
    type Types::SongType.connection_type, null: false

    argument :name, String, required: false

    def resolve(name: nil)
      if name.present?
        Song.where('name ILIKE ?', "%#{name}%")
      else
        Song.all
      end
    end
  end
end
