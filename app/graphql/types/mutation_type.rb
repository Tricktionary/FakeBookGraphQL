module Types
  class MutationType < Types::BaseObject
    field :create_song,
      mutation: Mutations::CreateSong,
      description: "Create an instance of a Song" 

    field :upload_book,
      mutation: Mutations::UploadBook,
      description: "Upload Book"

=begin
    field :updateBook, Types::BookType do
      description 'Update User'
    
      argument :book, InputObjects::BookInputType
      resolve lambda { |_t, args, ctx|
        puts args
      }
    end
=end 

  end
end
