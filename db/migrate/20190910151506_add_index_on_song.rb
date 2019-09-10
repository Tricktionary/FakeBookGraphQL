class AddIndexOnSong < ActiveRecord::Migration[5.2]
  def change
    add_index :songs, :book_id
  end
end
