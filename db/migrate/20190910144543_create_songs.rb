class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer "book_id"
      t.string "name"
      t.integer "page_range_start"
      t.integer "page_range_end"
      t.integer "page_count"
      t.timestamps
    end
  end
end
