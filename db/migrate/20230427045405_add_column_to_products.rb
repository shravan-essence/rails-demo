class AddColumnToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_sold, :boolean, default: false
  end
end
