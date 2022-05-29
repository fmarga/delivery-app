class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :volume
      t.integer :weight
      t.integer :distance
      t.string :from_address
      t.string :from_city
      t.string :from_state
      t.string :to_address
      t.string :to_city
      t.string :to_state
      t.string :code
      t.integer :estimated_delivery_time
      t.integer :value
      t.string :recipient_name
      t.references :vehicle, null: true, foreign_key: true
      t.references :shipping_company, null: true, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
