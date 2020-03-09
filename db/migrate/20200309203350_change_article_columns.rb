class ChangeArticleColumns < ActiveRecord::Migration[6.0]
  def change
  rename_column :articles, :data, :body
  add_column :articles, :bnl_id, :string, null: false, unique: true
  add_column :articles, :published_at, :datetime, null: false
  end
end
