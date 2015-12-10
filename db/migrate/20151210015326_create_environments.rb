class CreateEnvironments < ActiveRecord::Migration
  def change
    create_table :environments do |t|
      t.string :name
      t.string :status
      t.integer :last_used
      t.integer :visit_count
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
