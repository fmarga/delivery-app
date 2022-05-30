class OrdersController < ApplicationController
  before_action :authenticate_admin!, only: :new
  before_action :authenticate_admin_or_user, only: [:index]

  def index
    @company = user_signed_in? ? current_user.shipping_company : ShippingCompany.find(params[:shipping_company_id])
    @orders = @company.orders
  end

  def new
    @order = Order.new(params.permit([:shipping_company_id, :volume, :weight, :distance, :estimated_delivery_time, :value]))
    @order.shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end

  def create
    @order = Order.new(order_params)
    @order.save

    redirect_to order_path(@order), notice: 'Ordem de serviço cadastrada com sucesso!'
  end

  def show
    @order = Order.find(params[:id])
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

  private

  def order_params
    params.require(:order).permit(:volume, :weight, :distance, :from_address, :from_city, :from_state, :to_address, :to_city, :to_state, :recipient_name, :shipping_company_id, :value, :code)
  end
end