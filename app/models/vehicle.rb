class Vehicle < ApplicationRecord
  validates :license_plate, :brand, :model, :capacity, presence: true
  validates :license_plate, uniqueness: true
  validates :capacity, numericality: { only_integer: true }

  belongs_to :shipping_company
end
