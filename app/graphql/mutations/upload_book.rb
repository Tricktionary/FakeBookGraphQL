module Mutations 
    class UploadBook < Mutations::BaseMutation
        argument :book_name, String, required: true
        argument :fakebook_pdf, ApolloUploadServer::Upload, required: true
        argument :fakebook_csv, ApolloUploadServer::Upload, required: true

        def resolve(book_name:, fakebook_pdf:, fakebook_csv:)
            puts book_name
        end
    end 
end 

