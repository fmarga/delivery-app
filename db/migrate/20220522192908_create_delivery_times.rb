class CreateDeliveryTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_times do |t|
      t.integer :min_distance
      t.integer :max_distance
      t.integer :time_delivery
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
