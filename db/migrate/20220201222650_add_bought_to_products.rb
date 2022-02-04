# frozen_string_literal: true

class AddBoughtToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :times_bought, :integer, default: 0
  end
end
