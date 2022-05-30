class OrdersController < ApplicationController
  before_action :authenticate_admin!, only: :new


  def create
    @order = Order.new(order_params)
    @order.save

    redirect_to order_path(@order), notice: 'Ordem de serviço cadastrada com sucesso!'
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:volume, :weight, :distance, :from_address, :from_city, :from_state, :to_address, :to_city, :to_state, :recipient_name, :shipping_company_id, :value)
  end
end