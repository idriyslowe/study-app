require 'rails_helper'

describe Bookmark do
  it 'should be valid with name, path, user id, and screenshot data' do
    bookmark = Bookmark.new(
      name: 'Momma',
      path: 'http://www.pawderosa.com/images/puppies.jpg',
      user_id: 1,
      screenshot_data: 'poop.png'
      )
    expect(bookmark).to be_valid
  end

  it 'should be invalid without name' do
    bookmark = Bookmark.new(name: nil)
    bookmark.valid?
    expect(bookmark.errors[:name]).to include("can't be blank")
  end

  it 'should be invalid without path' do
    bookmark = Bookmark.new(path: nil)
    bookmark.valid?
    expect(bookmark.errors[:path]).to include("can't be blank")    
  end

  it 'should be invalid without user id' do
    bookmark = Bookmark.new(user_id: nil)
    bookmark.valid?
    expect(bookmark.errors[:user_id]).to include("can't be blank")    
  end

  it 'should be invalid without screenshot_data' do
    bookmark = Bookmark.new(screenshot_data: nil)
    bookmark.valid?
    expect(bookmark.errors[:screenshot_data]).to include("can't be blank")    
  end

  it 'should be valid if screenshot_data has png extension'
end