class AddOutletIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :outlet_id, :integer
  end
end
