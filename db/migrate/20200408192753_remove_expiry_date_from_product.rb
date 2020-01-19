class RemoveExpiryDateFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :expiry_date, :integer
  end
end
