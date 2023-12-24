class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, limit: 100, null: false
      t.integer :is_active, default: 0
      t.string :owner, limit: 100, null: false
      t.string :main_office, limit: 100
      t.string :phone, limit: 30
      t.uuid   :country_id, foreign_key: true
      t.integer :company_type, default: 0, null: false
      t.integer :company_size, default: 1, null: false
      t.float :avg_score, default: 0.0
      t.integer :total_reviews, default: 0
      t.boolean :is_good_company, default: true
      t.string :logo, limit: 255
      t.string :website, limit: 255

      t.timestamps
    end
  end
end
