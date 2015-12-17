class Environment < ActiveRecord::Base
  has_many :note_pages
  belongs_to :user
end
