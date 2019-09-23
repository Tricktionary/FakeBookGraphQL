require 'csv'
require 'origami'

module Mutations 
    class UploadBook < Mutations::BaseMutation
        argument :book_title, String, required: true
        argument :fakebook_pdf, Types::File, required: true
        argument :fakebook_csv, Types::File, required: true
        
        field :book, Types::BookType, null: true


        def resolve(book_title:, fakebook_pdf:, fakebook_csv:)

            # Upload the CSV and PDF into active storage 
            book = Book.create(book_title: book_title, pdf: fakebook_pdf, csv: fakebook_csv)
            
        
            pdf = Origami::PDF.read(book.pdf_on_disk)

            # Parse the pdf from active storage and create songs
            CSV.parse(book.csv.download, headers: true) do |row|
                song_name = row["title"]
                song_page_range_start = row["page"]
                song_page_range_end = row["last_page"]
                page_count = row["number_of_pages"]

                
            end
              
            byebug
            {
                book:book
            } 
        end
    end 
end 
