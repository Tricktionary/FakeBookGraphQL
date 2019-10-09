# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :create_song,
      mutation: Mutations::CreateSong,
      description: 'Create an instance of a Song'

    field :upload_book,
      mutation: Mutations::UploadBook,
      description: 'Upload Book'
    
    field :delete_book,
      mutation: Mutations::DeleteBook,
      description: 'Delete Book'
  end       
end
