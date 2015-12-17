class Comment < ActiveRecord::Base
  belongs_to :note_page
end
