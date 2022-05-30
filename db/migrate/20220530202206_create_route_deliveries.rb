class CreateRouteDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :route_deliveries do |t|
      t.string :localization
      t.datetime :date_and_time
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
