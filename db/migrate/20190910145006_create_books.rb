# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer 'page_count'
      t.string 'book_title'
      t.timestamps
    end
  end
end
