class AddItemIdToOrderDetail < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :item_id, :integer
  end
end
