# frozen_string_literal: true
module Types
  class MutationType < Types::BaseObject
    field :upload_book,
      mutation: Mutations::UploadBook,
      description: 'Upload Book'
    
    field :delete_book,
      mutation: Mutations::DeleteBook,
      description: 'Delete Book'
    
    field :update_book,
      mutation: Mutations::UpdateBook,
      description: 'Update Book'

    field :update_song,
      mutation: Mutations::UpdateSong,
      description: 'Update Song'
  end       
end
