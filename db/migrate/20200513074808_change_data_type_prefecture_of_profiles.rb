class ChangeDataTypePrefectureOfProfiles < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :prefecture, :integer
  end
end
