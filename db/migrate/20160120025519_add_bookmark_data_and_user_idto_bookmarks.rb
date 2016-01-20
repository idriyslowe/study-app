class AddBookmarkDataAndUserIdtoBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :screenshot_data, :text
    add_column :bookmarks, :user_id, :integer
  end
end
