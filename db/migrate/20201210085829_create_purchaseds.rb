class CreatePurchaseds < ActiveRecord::Migration[6.0]
  def change
    create_table :purchaseds do |t|
      t.string :shipping_address,        null: false
      t.string :postal_code,             null: false
      t.string :phone_number,            null: false
      t.string :municipalities,          null: false
      t.integer :address_id,             null: false
      t.string :building
      t.references :purchase_management, foreign_key: true
      t.timestamps
    end
  end
end
