# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
