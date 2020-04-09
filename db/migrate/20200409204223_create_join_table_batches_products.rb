# frozen_string_literal: true

class CreateJoinTableBatchesProducts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :batches, :products do |t|
      t.datetime 'created_at', null: false
      t.datetime 'updated_at', null: false
      t.integer 'quantity'
      t.integer 'batch_id'
      t.integer 'product_id'

      t.index %i[batch_id product_id]
      t.index %i[product_id batch_id]
    end
  end
end
