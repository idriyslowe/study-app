json.array! @notes.each do |note|
  json.id note.id
  json.text note.text
  json.note_page_id note.note_page_id
  json.bookmarks note.bookmarks
end