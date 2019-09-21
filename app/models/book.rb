include Rails.application.routes.url_helpers

class Book < ApplicationRecord
    # has_many :song, dependent: :destroy
    has_one_attached :pdf

    def pdf_url
        Rails.application.routes.url_helpers
        .rails_blob_url(self.pdf)
    end
end
