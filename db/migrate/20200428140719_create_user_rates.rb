class CreateUserRates < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rates do |t|
      t.references :user, null:false, foreign_key: true
      t.references :item, null:false, foreign_key: true
      t.string :rate, null:false
      t.timestamps
    end
  end
end
