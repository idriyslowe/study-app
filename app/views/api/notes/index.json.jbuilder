json.array! @notes.each do |note|
  json.id note.id
  json.text note.text
  json.note_page_id note.note_page_id

  json.bookmarks do
    note.bookmarks.each do |bookmark|
      json.name bookmark.name
      json.path bookmark.path
      json.note_id bookmark.note_id
    end
  end
end