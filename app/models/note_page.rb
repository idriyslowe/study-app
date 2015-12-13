class NotePage < ActiveRecord::Base
  belongs_to :environment
  has_many :bookmarks
  has_many :comments
end
