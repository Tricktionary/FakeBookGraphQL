module Mutations 
    class UploadBook < Mutations::BaseMutation
        argument :book_title, String, required: true
        argument :fakebook_pdf, Types::File, required: true
        argument :fakebook_csv, Types::File, required: true
        
        field :book, Types::BookType, null: true


        def resolve(book_title:, fakebook_pdf:, fakebook_csv:)
            book = Book.create(book_title: book_title, pdf: fakebook_pdf)
            {
                book:book
            } 
        end
    end 
end 

