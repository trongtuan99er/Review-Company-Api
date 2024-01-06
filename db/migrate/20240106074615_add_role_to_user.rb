class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role_id, :uuid, null: true
  end
end
