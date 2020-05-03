class AddUserIdToOutlets < ActiveRecord::Migration[5.2]
  def change
    add_column :outlets, :user_id, :integer
  end
end
