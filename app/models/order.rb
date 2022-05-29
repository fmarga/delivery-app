class Order < ApplicationRecord
  belongs_to :vehicle, optional: true
  belongs_to :shipping_company
end
