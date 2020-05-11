class RenameComementColumToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comement, :content
  end
end