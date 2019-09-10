module Types
  class MutationType < Types::BaseObject
    field :create_song,
      mutation: Mutations::CreateSong,
      description: "Create an instance of a Song" 
  end
end
