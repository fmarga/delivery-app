class ShippingCompanyController < ApplicationController
  before_action :shipping_company_params, only: [:show]

  def index
    @shipping_companies = ShippingCompany.all
  end

  def show; end

  
  private

  def shipping_company_params
    @shipping_company = ShippingCompany.find(params[:id])
  end
end