class AddOutletIdToBatch < ActiveRecord::Migration[5.2]
  def change
    add_column :batches, :outlet_id, :integer
  end
end
