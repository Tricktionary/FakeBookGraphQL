class Song < ApplicationRecord
    belongs_to :book
    has_one_attached :pdf

    def pdf_on_disk
        ActiveStorage::Blob.service.send(:path_for, self.pdf.key)
    end 
    
    def pdf_url
        Rails.application.routes.url_helpers
        .rails_blob_url(self.pdf)
    end
end
