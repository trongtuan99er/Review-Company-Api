class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews, id: :uuid do |t|
      t.uuid :user_id, foreign_key: true
      t.uuid :company_id, foreign_key: true
      t.integer :score, default: 1, null: false
      t.string :title, limit: 100
      t.text   :reviews_content
      t.boolean :vote_for_quit, default: false, null: false
      t.boolean :vote_for_work, default: true, null: false
      t.boolean :is_anonymous, defualt: false, null: false

      t.timestamps
    end
  end
end
