include Rails.application.routes.url_helpers

class Book < ApplicationRecord
    # has_many :song, dependent: :destroy
    has_one_attached :pdf
    has_one_attached :csv

    def csv_url
        Rails.application.routes.url_helpers
        .rails_blob_url(self.csv)
    end 

    def csv_on_disk
        ActiveStorage::Blob.service.send(:path_for, self.csv.key)
    end 

    def pdf_on_disk
        ActiveStorage::Blob.service.send(:path_for, self.pdf.key)
    end 
    
    def pdf_url
        Rails.application.routes.url_helpers
        .rails_blob_url(self.pdf)
    end
end
