class NotePage < ActiveRecord::Base
  belongs_to :environment
  has_many :bookmarks
  has_many :comments

  def text_sample
    truncate(text, :length => 10, :separator => ' ')
  end
end
