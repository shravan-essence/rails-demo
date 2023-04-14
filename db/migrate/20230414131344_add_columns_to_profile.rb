class AddColumnsToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :email, :string
  end
end
