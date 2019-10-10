# frozen_string_literal: true

module Types
  class File < GraphQL::Schema::Scalar
    description 'File to upload'

    # Interpret input and uploads file to Active Storage
    # Ref https://api.rubyonrails.org/v6.0.0/classes/ActionDispatch/Http/UploadedFile.html
    def self.coerce_input(file, _ctx)
      return nil if file.nil?

      ActionDispatch::Http::UploadedFile.new(
        filename: file.original_filename,
        type: file.content_type,
        head: file.headers,
        tempfile: file.tempfile
      )
    end
  end
end
