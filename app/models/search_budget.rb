class SearchBudget < ApplicationRecord
  validates :height, :width, :depth, :weight, :distance, presence: true
  validates :height, :width, :depth, :weight, :distance, numericality: { greater_than: 0 }

  belongs_to :admin

  before_validation :set_volume

  def set_volume
    self.volume = (height * width * depth).to_i
  end
end