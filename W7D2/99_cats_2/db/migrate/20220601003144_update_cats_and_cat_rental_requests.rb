class UpdateCatsAndCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :user_id, :integer, null: false
    add_index :cats, :user_id
    add_column :cat_rental_requests, :user_id, :integer
    add_index :cat_rental_requests, :user_id
  end
end
