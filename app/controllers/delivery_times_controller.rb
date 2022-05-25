class DeliveryTimesController < ApplicationController
  before_action :set_shipping_company
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @delivery_time = @shipping_company.delivery_times.new
  end

  def create
    @delivery_time = @shipping_company.delivery_times.new(delivery_time_params)
    @delivery_time.shipping_company = @shipping_company
    return render 'new' unless @delivery_time.save
    
    redirect_to @shipping_company, notice: 'Intervalo de prazo de entrega cadastrado com sucesso!'
  end

  private

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end

  def delivery_time_params
    params.require(:delivery_time).permit(:min_distance, :max_distance, :time_delivery)
  end
end