class RemoveDeliveryPayerIdFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :delivery_payer_id, :reference
  end
end
