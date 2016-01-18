json.array! @note_pages.each do |page|
  json.id page.id
  json.title page.title
  json.environment_id page.environment_id
  json.summary page.summary
  json.notes page.notes
end