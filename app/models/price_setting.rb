class PriceSetting < ApplicationRecord
  validates :min_volume, :max_volume, :min_weight, :max_weight, :distance_value, presence: true
  validates :min_volume, :max_volume, :min_weight, :max_weight, :distance_value, numericality: { only_integer: true }
  validates :max_volume, comparison: { greater_than: :min_volume }
  validates :max_weight, comparison: { greater_than: :min_weight }

  belongs_to :shipping_company
end
