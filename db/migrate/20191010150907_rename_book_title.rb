class RenameBookTitle < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :book_title, :title
  end
end
