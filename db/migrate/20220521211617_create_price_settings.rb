class CreatePriceSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :price_settings do |t|
      t.integer :min_volume
      t.integer :max_volume
      t.integer :min_weight
      t.integer :max_weight
      t.integer :distance_value
      t.references :shipping_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
