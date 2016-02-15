class NotePage < ActiveRecord::Base
  ActiveRecord::Base.include_root_in_json = true

  belongs_to :environment
  has_many :notes
  has_many :comments

end
