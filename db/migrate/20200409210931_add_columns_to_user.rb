# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string
    add_column :users, :company_name, :string
  end
end
