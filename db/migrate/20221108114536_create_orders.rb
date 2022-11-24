class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.string :postal_code
      t.string :address_code
      t.string :name
      t.integer :postage
      t.integer :bill
      t.integer :payment_method
      t.integer :status
      t.integer :customer_id
      t.timestamps
    end
  end
end
