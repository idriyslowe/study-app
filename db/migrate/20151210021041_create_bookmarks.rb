class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.string :name
      t.string :path
      t.integer :note_page_id

      t.timestamps null: false
    end
  end
end
