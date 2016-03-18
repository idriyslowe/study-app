class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :environments
  has_many :bookmarks

  def unassigned_bookmarks
    bookmarks.where(note_id: nil)
  end

end
