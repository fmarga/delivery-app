class OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :create]
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @company = current_user.shipping_company
    @orders = @company.orders
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    redirect_to root_path, notice: 'Ordem de serviço cadastrada com sucesso!'
  end

  def show
    @order = Order.find(params[:id])
    @routes = @order.route_deliveries
    @route = RouteDelivery.new
  end

  def search
    @order = Order.find_by(code: params[:query])
    redirect_to root_path, notice: 'Código informado é inválido' if @order.nil?
  end

  def approved
    @order = Order.find(params[:id])
    @order.approved!
    vehicle = Vehicle.find(params[:vehicle_id])
    @order.update vehicle: vehicle
    redirect_to @order, notice: 'Status atualizado com sucesso!'
  end

  def rejected
    @order = Order.find(params[:id])
    @order.rejected!
    redirect_to @order, notice: 'Seu pedido foi recusado'
  end

  def delivered
    @order = Order.find(params[:id])
    @order.delivered!
    redirect_to @order, notice: 'Pedido finalizado com sucesso'
  end

  private

  def order_params
    params.require(:order).permit(:volume, :weight, :distance, :from_address, :from_city, :from_state, :to_address, :to_city, :to_state, :recipient_name, :shipping_company_id, :value, :code, :estimated_delivery_time)
  end
end