class Comment < ActiveRecord::Base
  belongs_to :note_page
  belongs_to :user

  validates :user_id, :note_page_id, :text, presence: true

  def readable_created_at
    created_at.strftime("Posted on %m/%d/%Y")
  end

  def commenter
    user = User.where("id = ?", user_id)
    return user.handle
  end
end
