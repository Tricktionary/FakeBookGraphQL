class AddBookCodeToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :book_code, :string
  end
end
