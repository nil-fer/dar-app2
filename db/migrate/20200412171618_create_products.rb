class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :weight_type
      t.string :weight_amount
      t.string :product_pic
      t.integer :user_id
      t.integer :category

      t.timestamps
    end
  end
end
