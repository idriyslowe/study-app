class Note < ActiveRecord::Base
  belongs_to :note_page
  has_many :bookmarks
 
end
