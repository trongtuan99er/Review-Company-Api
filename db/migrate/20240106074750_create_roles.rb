class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles, id: :uuid do |t|

      t.integer :role, null: false, default: 0
      t.integer :status, default: 1
      t.boolean :allow_all_action, default: false
      t.boolean :allow_create, default: false
      t.boolean :allow_read, default: true
      t.boolean :allow_update, default: false
      t.timestamps
    end
  end
end
