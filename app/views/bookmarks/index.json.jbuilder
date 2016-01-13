json.array! @bookmarks.each do |bookmark|
  json.name bookmark.name
  json.path bookmark.path
  json.note_id bookmark.note_id
end