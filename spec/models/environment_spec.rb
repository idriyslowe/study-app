require 'rails_helper'

describe Environment do
  it 'is valid with a name, user id, and image path' do
    environment = Environment.new(
      name: 'Horse Training',
      user_id: 1,
      image_path: 'http://www.pawderosa.com/images/puppies.jpg'
      )
    expect(environment).to be_valid
  end

  it 'is invalid without a name' do
    environment = Environment.new(name: nil)
    environment.valid?
    expect(environment.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a user id' do
    environment = Environment.new(user_id: nil)
    environment.valid?
    expect(environment.errors[:user_id]).to include("can't be blank")
  end

  it 'is invalid without an image path' do
    environment = Environment.new(image_path: nil)
    environment.valid?
    expect(environment.errors[:image_path]).to include("can't be blank")    
  end

  it 'does not allow duplicate environment names per user'
end

# worried about that user_id & image_path test. must generate the user_id dynamically?
