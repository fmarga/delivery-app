class RouteDelivery < ApplicationRecord
  validates :localization, :date_and_time, presence: true

  belongs_to :order
end
