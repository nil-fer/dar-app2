class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address, :hstore
    add_column :users, :company_id, :integer
    add_column :users, :outlet_id, :integer

    add_column :companies, :company_name, :string
    add_column :companies, :user_id, :integer
    add_column :companies, :logo, :string
    add_column :companies, :company_cover, :string
  end
end
