class NotePage < ActiveRecord::Base
  belongs_to :environment
  has_many :notes
  has_many :comments
end
