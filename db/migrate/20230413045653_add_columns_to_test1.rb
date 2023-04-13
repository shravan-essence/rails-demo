class AddColumnsToTest1 < ActiveRecord::Migration[7.0]
  def change
    add_column :test1s, :title, :string
    add_column :test1s, :body, :text
  end
end
