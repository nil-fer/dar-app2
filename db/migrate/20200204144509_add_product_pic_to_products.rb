class AddProductPicToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :product_pic, :string
  end
end
