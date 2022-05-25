class PriceSettingsController < ApplicationController
  before_action :set_shipping_company
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @price = @shipping_company.price_settings.new
  end

  def create
    @price = @shipping_company.price_settings.new(price_setting_params)
    @price.shipping_company = @shipping_company
    return render 'new' unless @price.save

    redirect_to @shipping_company, notice: 'Intervalo de preço cadastrado com sucesso!'
  end


  private

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end

  def price_setting_params
    params.require(:price_setting).permit(:min_weight, :max_weight, :min_volume, :max_volume, :distance_value)
  end
end