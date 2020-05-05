class AddOutletCategoryToOutlet < ActiveRecord::Migration[5.2]
  def change
    add_column :outlets, :outlet_category, :integer
  end
end
