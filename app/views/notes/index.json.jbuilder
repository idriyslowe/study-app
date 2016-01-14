json.array! @notes.each do |note|
 json.text note.text
 json.note_page_id note.note_page_id
end