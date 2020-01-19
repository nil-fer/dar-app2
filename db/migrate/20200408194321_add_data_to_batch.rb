class AddDataToBatch < ActiveRecord::Migration[5.2]
  def change
    add_column :batches, :activation_start, :datetime
    add_column :batches, :activation_end, :datetime
    add_column :batches, :discount, :integer
  end
end
