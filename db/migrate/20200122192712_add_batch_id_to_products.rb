class AddBatchIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :batch_id, :integer
  end
end
