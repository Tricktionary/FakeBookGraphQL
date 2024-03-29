# frozen_string_literal: true

include Rails.application.routes.url_helpers

class Book < ApplicationRecord
  has_many :song, dependent: :destroy
  has_one_attached :pdf
  has_one_attached :csv

  validates :title, uniqueness: true
  validates :title, presence: true
  validates :page_count, numericality: { greater_than: 0 }

  def csv_url
    Rails.application.routes.url_helpers
         .rails_blob_url(csv)
  end

  def csv_on_disk
    ActiveStorage::Blob.service.send(:path_for, csv.key)
  end

  def pdf_on_disk
    ActiveStorage::Blob.service.send(:path_for, pdf.key)
  end

  def pdf_url
    Rails.application.routes.url_helpers
         .rails_blob_url(pdf)
  end
end
