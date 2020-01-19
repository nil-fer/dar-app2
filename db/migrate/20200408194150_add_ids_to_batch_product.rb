class AddIdsToBatchProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :batch_products, :product_id, :integer
    add_column :batch_products, :batch_id, :integer
    add_column :batch_products, :quantity, :integer
  end
end
