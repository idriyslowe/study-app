class AddImagePathToEnvironments < ActiveRecord::Migration
  def change
    add_column :environments, :image_path, :string
  end
end
