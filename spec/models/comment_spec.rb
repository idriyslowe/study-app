require 'rails_helper'

describe Comment do
  it 'should be valid with a user id, note page id, and text' do
    comment = Comment.new(
      user_id: 1,
      note_page_id: 1,
      text: 'Dummy Text'
      )
    expect(comment).to be_valid
  end

  it 'should be invalid without user id' do
    comment = Comment.new(user_id: nil)
    comment.valid?
    expect(comment.errors[:user_id]).to include("can't be blank")
  end

  it 'should be invalid without note page id' do
    comment = Comment.new(note_page_id: nil)
    comment.valid?
    expect(comment.errors[:note_page_id]).to include("can't be blank")
  end

  it 'should be invalid without text' do
    comment = Comment.new(text: nil)
    comment.valid?
    expect(comment.errors[:text]).to include("can't be blank")
  end

end

# test readable_created_at & commenter