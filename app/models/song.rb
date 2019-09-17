class Song < ApplicationRecord
    # belongs_to :book
    has_one_attached :pdf
end
