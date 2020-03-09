# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.json :data, default: {}, null: false
      t.string :title
      t.text :summary

      t.timestamps
    end
  end
end
