class CreateCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id
      t.date :
      t.timestamps
    end
  end
end
