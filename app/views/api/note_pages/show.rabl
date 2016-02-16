object @note_pages
attributes :id, :environment_id, :title, :summary
child :notes do
  attributes :id, :text, :note_page_id
  child :bookmarks do
    attributes :id, :name, :path, :note_id, :screenshot_data, :user_id
  end
end
