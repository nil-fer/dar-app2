class RemoveBatchIdFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :batch_id, :integer
  end
end
