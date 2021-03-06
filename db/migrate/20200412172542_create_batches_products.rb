# frozen_string_literal: true

class CreateBatchesProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :batches_products do |t|
      t.references :batch, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
