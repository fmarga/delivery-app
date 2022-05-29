class SearchBudget < ApplicationRecord
  belongs_to :admin

  before_create :set_volume

  def set_volume
    self.volume = (height.to_d * width.to_d * depth.to_d) / 1000000
  end
end