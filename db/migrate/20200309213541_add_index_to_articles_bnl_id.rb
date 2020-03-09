class AddIndexToArticlesBnlId < ActiveRecord::Migration[6.0]
  def change
    add_index :articles, :bnl_id
  end
end
