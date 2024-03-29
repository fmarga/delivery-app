class SearchBudgetsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @budget = SearchBudget.new
  end

  def create
    @budget = SearchBudget.new(set_budgets_params)
    @budget.admin = current_admin
    @budget.save
    redirect_to search_budget_path(@budget.id), notice: 'Pesquisa realizada com sucesso'
  end

  def show
    @budget = SearchBudget.find(params[:id])
    @search_prices = search_prices(@budget)
    @shipping_companies = @search_prices.keys
    @order = Order.new
  end

  private

  def set_budgets_params 
    params.require(:search_budget).permit(:height, :width, :depth, :weight, :distance)
  end

  def search_prices(budget)
    search_price = {}
    weight_ranges(budget).each do |weight|
      company = weight.shipping_company
      time_delivery = delivery_time_range(company, budget)
      time_delivery_view = delivery_time_range(company, budget).time_delivery

      final_price = weight.distance_value * budget.distance
      search_price[company] = [time_delivery, final_price, time_delivery_view]
    end
    search_price
  end

  def weight_ranges(budget)
    PriceSetting.where("min_weight <= ? AND max_weight >= ? AND min_volume <= ? AND max_volume >= ?", budget.weight, budget.weight, budget.volume, budget.volume)
  end

  def delivery_time_range(company, budget)
    DeliveryTime.where(shipping_company: company).find_by("min_distance <= ? AND max_distance >= ?", budget.distance, budget.distance)
  end
end