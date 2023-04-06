class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :count
      t.references :comment
      t.timestamps
    end
  end
end
