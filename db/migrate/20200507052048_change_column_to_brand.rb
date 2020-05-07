class ChangeColumnToBrand < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :items, :brands
    remove_reference :items, :brand_id
    add_column :items, :brand, :string
  end
end
