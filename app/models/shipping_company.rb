class ShippingCompany < ApplicationRecord
  validates :corporate_name, :brand_name, :registration_number, :email_domain, :postal_code, presence: true
  validates :registration_number, :email_domain, :postal_code, uniqueness: true
  validates :registration_number, length: { is: 14 }
  validates :registration_number, numericality: { only_integer: true }
  validates :postal_code, format: { with: /\d{5}-?\d{3}/ }

  has_many :vehicles
  has_many :price_settings
  has_many :delivery_times
  has_many :users
end
