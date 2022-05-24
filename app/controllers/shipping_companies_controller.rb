class ShippingCompaniesController < ApplicationController
  before_action :set_shipping_company, only: [:show]
  # before_action :authenticate_admin!

  def index
    @shipping_companies = ShippingCompany.all
  end

  def show
    @vehicles = @shipping_company.vehicles unless @shipping_company.vehicles.empty?
    @prices = @shipping_company.price_settings unless @shipping_company.price_settings.empty?
    @delivery_times = @shipping_company.delivery_times unless @shipping_company.delivery_times.empty?
  end

  def new
    @shipping_company = ShippingCompany.new
  end

  def create
    @shipping_company = ShippingCompany.new(shipping_company_params)
    if @shipping_company.save
      redirect_to shipping_companies_path, notice: 'Transportadora cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Não foi possível cadastrar transportadora'
      render 'new'
    end
  end
  
  private

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:id])
  end

  def shipping_company_params
    params.require(:shipping_company).permit(:brand_name, :corporate_name, :registration_number, :email_domain, :address, :city, :state, :postal_code)
  end
end