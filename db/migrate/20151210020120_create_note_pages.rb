class CreateNotePages < ActiveRecord::Migration
  def change
    create_table :note_pages do |t|
      t.string :title
      t.text :text
      t.integer :environment_id

      t.timestamps null: false
    end
  end
end
