class ShippingCompaniesController < ApplicationController
  before_action :set_shipping_company, only: [:show]

  def index
    @shipping_companies = ShippingCompany.all
  end

  def show; end

  def new
    @shipping_company = ShippingCompany.new
  end

  def create
    @shipping_company = ShippingCompany.new(shipping_company_params)
    @shipping_company.save
    redirect_to shipping_companies_path
  end
  
  private

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:id])
  end

  def shipping_company_params
    params.require(:shipping_company).permit(:brand_name, :corporate_name, :registration_number, :email_domain, :address, :city, :state, :postal_code)
  end
end