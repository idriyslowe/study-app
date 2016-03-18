class Environment < ActiveRecord::Base
  has_many :note_pages
  belongs_to :user

  validates :name, :user_id, :image_path, presence: true
  # before_create :duplicate_user_env_name?

  # def duplicate_user_env_name?
  #   user_environments = Environment.where(name: name, user_id: current_user.id)
  #   unless user_environments.nil?
  #     raise 'Environment name already in use.'
  #   end
  # end

end
