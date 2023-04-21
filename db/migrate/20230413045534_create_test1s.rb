class CreateTest1s < ActiveRecord::Migration[7.0]
  def change
    create_table :test1s, &:timestamps
  end
end
