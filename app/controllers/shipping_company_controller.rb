class ShippingCompanyController < ApplicationController
  def index
    @shipping_companies = ShippingCompany.all
  end
end