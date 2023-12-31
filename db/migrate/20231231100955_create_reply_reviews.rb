class CreateReplyReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reply_reviews, id: :uuid do |t|
      t.references :review, null: false, foreign_key: true, type: :uuid
      t.uuid :user_id, null: false
      t.text :content, null: false
      t.boolean :is_deleted, default: false
      t.boolean :is_edited, default: false

      t.timestamps
    end
  end
end
