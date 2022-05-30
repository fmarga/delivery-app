class RouteDeliveriesController < ApplicationController

  def create
    @route = RouteDelivery.new(set_route_params)
    @route.order = Order.find(params[:order_id])
    @route.save
    redirect_to @route.order, notice: 'Localização atualizada com sucesso!'
  end

  private
  def set_route_params
    params.require(:route_delivery).permit(:localization, :date_and_time)
  end
end