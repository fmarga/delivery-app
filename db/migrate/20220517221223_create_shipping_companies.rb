class CreateShippingCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_companies do |t|
      t.string :corporate_name
      t.string :brand_name
      t.integer :registration_number
      t.string :email_domain
      t.string :address
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end
