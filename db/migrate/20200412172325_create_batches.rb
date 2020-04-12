class CreateBatches < ActiveRecord::Migration[5.2]
  def change
    create_table :batches do |t|
      t.datetime :activation_start
      t.datetime :activation_end
      t.integer :discount
      t.integer :user_id

      t.timestamps
    end
  end
end
