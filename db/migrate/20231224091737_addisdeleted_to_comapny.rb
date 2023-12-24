class AddisdeletedToComapny < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :is_deleted, :boolean, default: false
    add_column :reviews, :is_deleted, :boolean, default: false
  end
end
