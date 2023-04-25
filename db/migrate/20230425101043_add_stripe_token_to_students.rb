class AddStripeTokenToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :stripe_token, :string
  end
end
