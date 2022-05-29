class SearchBudgetsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @budget = SearchBudget.new
  end

  def create
    @budget = SearchBudget.new(set_budgets_params)
    @budget.admin = current_admin
    @budget.save
    redirect_to @budget, notice: 'Pesquisa realizada com sucesso'
  end

  def show
    @budget = SearchBudget.find(params[:id])
    @search_prices = search_prices(@budget)
    @shipping_companies = @search_prices.keys
  end

  private

  def set_budgets_params 
    params.require(:search_budget).permit(:height, :width, :depth, :weight, :distance)
  end

  def search_prices(budget)
    search_price = {}
    weight_ranges(budget).each do |weight|
      ship_co = weight.price_setting.shipping_company
      time_delivery = delivery_time_range(budget)

      final_price = weight.value * budget.distance
      search_price[ship_co] = [time_delivery, final_price]
    end
    search_price
  end

  def weight_ranges(budget)
    weight_ranges = PriceSetting.where("min_weight <= ? AND max_weight >= ? AND min_volume <= ? AND max_volume >= ?", budget.weight, budget.weight, budget.volume, budget.volume)
  end

  def delivery_time_range(budget)
    time = DeliveryTime.where("min_distance <= ? AND max_distance >= ?", distance: budget.distance, budget.distance)
  end
end