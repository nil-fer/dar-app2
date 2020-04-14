class AddCompanyCategoryToOutlet < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :company_category, :integer
  end
end
