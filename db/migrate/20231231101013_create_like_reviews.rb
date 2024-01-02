class CreateLikeReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, id: :uuid do |t|
      t.references :review, null: false, foreign_key: true, unique: true, type: :uuid
      t.uuid :user_id, null: false
      t.integer :status, null: false, default: 1

      t.timestamps
    end
    add_index :likes, [:review_id, :user_id], unique: true
  end
end
