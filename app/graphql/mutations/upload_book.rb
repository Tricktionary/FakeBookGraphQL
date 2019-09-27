require 'csv'
require 'combine_pdf'

module Mutations 
    class UploadBook < Mutations::BaseMutation
        argument :book_title, String, required: true
        argument :fakebook_pdf, Types::File, required: true
        argument :fakebook_csv, Types::File, required: true
        
        field :book, Types::BookType, null: true


        def resolve(book_title:, fakebook_pdf:, fakebook_csv:)

            # Upload the CSV and PDF into active storage 
            book = Book.create(book_title: book_title, pdf: fakebook_pdf, csv: fakebook_csv)
            
            #Parse the PDF from active storage
            book_pdf = CombinePDF.load(book.pdf_on_disk)

            # Parse the csv from active storage and create songs with pdf
            CSV.parse(book.csv.download, headers: true) do |row|
                song_name = row["title"]
                song_page_range_start = row["page"].to_i
                song_page_range_end = row["last_page"].to_i
                page_count = row["number_of_pages"]        
                
                song_pdf = CombinePDF.new
                
                # Push song pages into a song page instance (Inneficient)
                iter = 0
                book_pdf.pages.each do |page|
                  iter += 1
                  if (iter >= song_page_range_start && iter <= song_page_range_end)
                    song_pdf << page
                  end 
                end
                song_pdf.save("storage/"+song_name+".pdf")

                # Create Instance of the song object
                song = Song.create(name: song_name, 
                            page_range_start: song_page_range_start, 
                            page_range_end: song_page_range_end,
                            page_count: page_count,
                            pdf: song_pdf,
                            book: book,
                        )
                byebug

            end
              
            {
                book:book
            } 
        end
    end 
end 
