class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.integer :note_page_id

      t.timestamps null: false
    end
  end
end
