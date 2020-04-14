class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :batches_products, :quantity, :integer, default: 0
  end
end
