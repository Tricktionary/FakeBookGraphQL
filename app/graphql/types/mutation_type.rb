module Types
  class MutationType < Types::BaseObject
    field :create_song,
      mutation: Mutations::CreateSong,
      description: "Create an instance of a Song" 

    field :upload_book,
      mutation: Mutations::UploadBook,
      description: "Upload Book"
  end
end
