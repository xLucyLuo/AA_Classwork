class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title, null: false, index:true
      t.string :description, null: false
      t.boolean :secret, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps
    end
  end
end
