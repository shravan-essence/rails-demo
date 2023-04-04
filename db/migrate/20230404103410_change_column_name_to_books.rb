class ChangeColumnNameToBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :author, :owner
  end
end
