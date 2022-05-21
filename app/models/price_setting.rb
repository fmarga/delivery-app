class PriceSetting < ApplicationRecord
  validates :min_volume, :max_volume, :min_weight, :max_weight, :distance_value, presence: true
  validates :min_volume, :max_volume, :min_weight, :max_weight, :distance_value, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :shipping_company
end
