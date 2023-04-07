class CreateCustomersGroceriesJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :customers, :groceries do |t|
      t.index :customer_id
      t.index :grocery_id
    end
  end
end
