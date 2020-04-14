class CreateOutlet < ActiveRecord::Migration[5.2]
  def change
    create_table :outlets do |t|
      t.hstore :address
      t.integer :company_id
      t.string :email 
    end
  end
end
