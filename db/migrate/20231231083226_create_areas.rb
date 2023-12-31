class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas, id: :uuid do |t|
      t.string :name, null: false, limit: 255
      t.string :tenant_name, null: false, limit: 255
      t.integer :status, default: 1, null: false

      t.timestamps
    end
  end
end
