class RemoveCloseTimeFromBatch < ActiveRecord::Migration[5.2]
  def change
    remove_column :batches, :close_time, :datetime
  end
end
