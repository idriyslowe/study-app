class ChangeManyModelAttributes < ActiveRecord::Migration
  def change
    remove_column :environments, :last_used, :integer
    remove_column :note_pages, :text, :text
    add_column :note_pages, :summary, :string
    rename_column :bookmarks, :note_page_id, :note_id
    remove_column :comments, :bookmark_id, :integer
    add_column :comments, :note_page_id, :integer
    add_column :environments, :sharing, :boolean
    add_column :users, :handle, :string
  end
end
