require 'rails_helper'

describe NotePage do
  it 'is valid with a title and environment id' do
    note_page = NotePage.new(
      title: 'Horse Currying',
      environment_id: 1
      )
    expect(note_page).to be_valid
  end

  it 'is invalid without a title' do
    note_page = NotePage.new(title: nil)
    note_page.valid?
    expect(note_page.errors[:title]).to include("can't be blank")
  end

  it 'is invalid without an environment id' do
    note_page = NotePage.new(environment_id: nil)
    note_page.valid?
    expect(note_page.errors[:environment_id]).to include("can't be blank")
  end
end