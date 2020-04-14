class ChangeWeightTypeInProduct < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :weight_type, 'integer USING CAST(weight_type AS integer)'
  end
end
