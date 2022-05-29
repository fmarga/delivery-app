class OrdersController < ApplicationController
  before_action :authenticate_admin!, only: :new
  def new
    @order = Order.new
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end
end