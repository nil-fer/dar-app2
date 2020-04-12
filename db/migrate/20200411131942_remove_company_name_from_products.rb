class RemoveCompanyNameFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :company_name, :string
  end
end
