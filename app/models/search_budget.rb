class SearchBudget < ApplicationRecord
  belongs_to :admin

  before_create :set_volume

  def set_volume
    self.volume = (height * width * depth).to_i
  end
end