class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :weight_type
      t.integer :quantity
      t.integer :price
      t.integer :sale_price
      t.string :company_name

      t.timestamps
    end
  end
end
