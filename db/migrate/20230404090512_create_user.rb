class CreateUser < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    execute <<-SQL
      ALTER TABLE users ADD mobile_no Number;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE users DROP mobile_no;
    SQL

    drop_table :users
  end
end
