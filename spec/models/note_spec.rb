require 'rails_helper'

describe Note do
  it 'should be valid with note page id' do
    note = Note.new(
      note_page_id: 1
      )
    expect(note).to be_valid
  end

  it 'should be invalid without note page id' do
    note = Note.new(note_page_id: nil)
    note.valid?
    expect(note.errors[:note_page_id]).to include("can't be blank")
  end
end