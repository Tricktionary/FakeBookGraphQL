class Book < ApplicationRecord
    has_many :song, dependent: :destroy
end
