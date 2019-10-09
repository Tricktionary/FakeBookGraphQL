class RemoveColumnFromBookTable < ActiveRecord::Migration[5.2]
  def change
    def up
      remove_column :books, :book_code
      remove_column :books, :page_count
      remove_column :songs, :page_count
    end
  
    def down
      add_column :books, :book_code, :string
      add_column :books, :page_count, :integer
      add_column :songs, :page_count, :integer
    end
  end
end
