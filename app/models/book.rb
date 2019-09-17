class Book < ApplicationRecord
    # has_many :song, dependent: :destroy
    has_one_attached :pdf
end
