class ChangeRenameAndDetatypeOnItems < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :size_id, true
    change_column_null :items, :buyer_id, true
    change_column_null :items, :brand_id, true
    change_column :items, :delivery_method, :integer
    change_column :items, :delivary_from_location, :integer
    change_column :items, :preparation_day, :integer
    change_column :profiles, :tel_number, :string
    rename_column :items, :delivary_from_location, :delivery_from_location
    add_column :items, :delivery_fee, :integer
  end
end
