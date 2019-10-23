# frozen_string_literal: true

require 'csv'
require 'combine_pdf'

module Mutations
  class UploadBook < Mutations::BaseMutation
    argument :title, String, required: true
    argument :fakebook_pdf, Types::File, required: true
    argument :fakebook_csv, Types::File, required: true

    field :book, Types::BookType, null: true

    def resolve(title:, fakebook_pdf:, fakebook_csv:)
       
      if fakebook_csv.content_type != 'text/csv'
        raise GraphQL::ExecutionError, 'fakebook_csv is not a valid .csv file'
        return
      end

      if fakebook_pdf.content_type != 'application/pdf'
        raise GraphQL::ExecutionError, 'fakebook_pdf is not a valid .pdf file'
        return
      end

      page_count = PDF::Reader.new(fakebook_pdf.tempfile).page_count

      # Upload the CSV and PDF into active storage
      book = Book.create(title: title, pdf: fakebook_pdf, csv: fakebook_csv, page_count:page_count)

      # Parse the PDF from active storage
      book_pdf = CombinePDF.load(book.pdf_on_disk)

      if book.present?
        # Parse the csv from active storage and create songs with pdf
        CSV.parse(book.csv.download.force_encoding('UTF-8'), headers: true) do |row|
          song_name = row['title']
          song_page_range_start = row['page'].to_i
          song_page_range_end = row['last_page'].to_i
          page_count = row['number_of_pages']

          song_pdf = CombinePDF.new

          # Push song pages into a song page instance (In-efficient)
          book_pdf.pages.each.with_index(1) do |page, iter|
            if iter >= song_page_range_start && iter <= song_page_range_end
              song_pdf << page
            end
          end

          storage_path = 'storage/tmp/' + song_name.delete(' ') + '.pdf'
          song_pdf.save(storage_path)

          # Create Instance of the song object
          song = Song.create(name: song_name,
                             page_range_start: song_page_range_start,
                             page_range_end: song_page_range_end,
                             page_count: page_count,
                             pdf: song_pdf,
                             book: book)

          song.pdf.attach(io: File.open(storage_path), filename: song_name.delete(' '), content_type: 'application/pdf')
        end
        {
          book: book
        }
      else
        raise GraphQL::ExecutionError, 'Book title invalid'
      end
    end
  end
end
