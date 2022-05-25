class VehiclesController < ApplicationController
  before_action :set_shipping_company
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @vehicle = @shipping_company.vehicles.new
  end

  def create
    @vehicle = @shipping_company.vehicles.new(vehicle_params)
    @vehicle.shipping_company = @shipping_company
    return render 'new' unless @vehicle.save
    
    redirect_to @shipping_company, notice: 'Veículo cadastrado com sucesso'
  end

  private
  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :brand, :model, :fabrication_year, :capacity)
  end

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end
end