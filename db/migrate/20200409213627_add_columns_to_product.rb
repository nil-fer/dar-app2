# frozen_string_literal: true

class AddColumnsToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :user_id, :integer
    add_column :products, :category, :integer
    add_column :products, :weight_quantity, :integer
  end
end
