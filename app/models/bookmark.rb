class Bookmark < ActiveRecord::Base
  belongs_to :note
  belongs_to :user

  validates :name, :path, :user_id, :screenshot_data, presence: true
end

# make sure screenshot_data isn't printing to a file if it isn't saving to the database
