class PriceSettingsController < ApplicationController

  def new
    @price = PriceSetting.new
  end
end