# frozen_string_literal: true

class AddUniqueColumnToBookName < ActiveRecord::Migration[5.2]
  def change
    add_index :books, :book_title, unique: true
  end
end
