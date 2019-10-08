# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :book
  has_one_attached :pdf

  validates :name, presence: true
  validates :page_range_start, :page_count, numericality: { greater_than: 0 }
  validates :page_range_end, numericality: { greater_than: :page_range_start }

  def pdf_on_disk
    ActiveStorage::Blob.service.send(:path_for, pdf.key)
  end

  def pdf_url
    Rails.application.routes.url_helpers
         .rails_blob_url(pdf)
  end
end
