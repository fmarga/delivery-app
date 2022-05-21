class PriceSetting < ApplicationRecord
  validates :min_volume, :max_volume, :min_weight, :max_weight, :distance_value, presence: true

  belongs_to :shipping_company
end
