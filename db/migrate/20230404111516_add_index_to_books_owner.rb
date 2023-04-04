class AddIndexToBooksOwner < ActiveRecord::Migration[7.0]
  def change
    add_index :Books, :owner, name: "index_Books_on_owner"
  end
end
