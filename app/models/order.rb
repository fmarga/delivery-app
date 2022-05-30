class Order < ApplicationRecord
  validates :volume, :weight, :distance, :from_address, :from_city, :from_state, :to_address, :to_city, :to_state, :value, :recipient_name, presence: true
  validates :volume, :weight, :distance, :value, numericality: { greather_than: 0 }
  validates :code, uniqueness: true

  before_create :generate_code

  enum status: { pending: 0, approved: 5, rejected: 10, delivered: 15 }

  belongs_to :vehicle, optional: true
  belongs_to :shipping_company, optional: true
  has_many :route_deliveries

  def generate_code
    self.code = SecureRandom.alphanumeric(15).upcase
  end
end
