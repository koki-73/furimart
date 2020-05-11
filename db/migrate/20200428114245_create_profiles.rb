class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :post_code, null: false
      t.integer :tel_number
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :bullding
      t.string :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
