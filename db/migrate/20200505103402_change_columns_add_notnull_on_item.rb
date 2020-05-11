class ChangeColumnsAddNotnullOnItem < ActiveRecord::Migration[5.2]
  def change
    change_column_null :items, :delivery_fee, false
  end
end

