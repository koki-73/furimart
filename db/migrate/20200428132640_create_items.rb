class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                   null: false
      t.integer :price,                 null: false
      t.integer :status,                null: false
      t.references :brand,              null: false, foreign_key: true
      t.string :buyer_id,               null: false
      t.string :delivery_payer_id,      null: false
      t.references :category,           null: false, foreign_key: true
      t.references :user,               null: false, foreign_key: true
      t.references :size,                null: false, foreign_key: true
      t.string :delivery_method,        null: false
      t.string :delivary_from_location, null: false
      t.text :item_explanation,         null: false
      t.integer :preparation_day,        null: false
      t.timestamps
    end
  end
end
