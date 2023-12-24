class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, limit: 50, null: false
      t.integer :is_active, default: 0
      t.string :owner, limit: 50, null: false
      t.string :main_office, limit: 100
      t.string :phone, limit: 15
      t.uuid   :country_id, foreign_key: true, null: false
      t.integer :company_type, default: 0, null: false
      t.integer :company_size, default: 1, null: false
      t.float :avg_score
      t.integer :total_reviews, default: 0
      t.boolean :is_good_company, default: true
      t.string :logo, limit: 255
      t.string :website, limit: 255

      t.timestamps
    end
  end
end
