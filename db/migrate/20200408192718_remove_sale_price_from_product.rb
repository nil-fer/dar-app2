# frozen_string_literal: true

class RemoveSalePriceFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :sale_price, :integer
  end
end
