class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method, default: 0
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
