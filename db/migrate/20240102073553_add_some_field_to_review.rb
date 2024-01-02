class AddSomeFieldToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :total_like, :integer, default: 0
    add_column :reviews, :total_dislike, :integer, default: 0
    add_column :reviews, :total_reply, :integer, default: 0
  end
end
