class Note < ActiveRecord::Base
  belongs_to :note_page
  has_many :bookmarks
 
  validates :note_page_id, presence: true
end
