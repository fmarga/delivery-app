class Vehicle < ApplicationRecord
  validates :license_plate, :brand, :model, :capacity, presence: true
  validates :license_plate, uniqueness: true
  validates :license_plate, format: { with: /[A-Z]{3}[0-9][A-Z][0-9]{2}/ }
  validates :license_plate, length: { is: 7 }
  validates :capacity, numericality: { only_integer: true }

  belongs_to :shipping_company
end
