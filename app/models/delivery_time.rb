class DeliveryTime < ApplicationRecord
  validates :min_distance, :max_distance, :time_delivery, presence: true
  validates :min_distance, :max_distance, :time_delivery, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :shipping_company
end
