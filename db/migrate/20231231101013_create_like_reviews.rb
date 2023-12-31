class CreateLikeReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :like_reviews, id: :uuid do |t|
      t.references :review, null: false, foreign_key: true, unique: true, type: :uuid
      t.uuid :user_id, null: false
      t.boolean :status, null: false, default: 1

      t.timestamps
    end
    add_index :like_reviews, [:review_id, :user_id], unique: true
  end
end
