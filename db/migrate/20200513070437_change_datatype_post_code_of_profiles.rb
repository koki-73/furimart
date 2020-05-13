class ChangeDatatypePostCodeOfProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :post_code, :string
    rename_column :profiles, :bullding, :building
  end
end
