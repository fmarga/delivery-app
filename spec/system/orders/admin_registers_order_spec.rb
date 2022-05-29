require 'rails_helper'

describe 'Administrador cadastra uma ordem de serviço' do
  it 'através do resultado de uma busca de orçamentos' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)
    PriceSetting.create!(min_volume: 6, max_volume: 10, min_weight: 11, max_weight: 30, distance_value: 80, shipping_company: entregas)
    DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: entregas)
    DeliveryTime.create!(min_distance: 101, max_distance: 500, time_delivery: 5, shipping_company: entregas)
    sc = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 80, shipping_company: sc)
    PriceSetting.create!(min_volume: 6, max_volume: 15, min_weight: 11, max_weight: 20, distance_value: 100, shipping_company: sc)
    DeliveryTime.create!(min_distance: 1, max_distance: 200, time_delivery: 3, shipping_company: sc)
    DeliveryTime.create!(min_distance: 201, max_distance: 400, time_delivery: 6, shipping_company: sc)
    transportadora = ShippingCompany.create!(corporate_name: 'Serviços de Outras Entregas LTDA', brand_name: 'Entregas onFire!', registration_number: '13053544000863', email_domain: 'entregasonfire.com.br', address: 'Av do Transporte, 700', city: 'Porto Alegre', state: 'RS', postal_code: '96483-570')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: transportadora)
    PriceSetting.create!(min_volume: 6, max_volume: 15, min_weight: 11, max_weight: 20, distance_value: 80, shipping_company: transportadora)
    DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: transportadora)
    DeliveryTime.create!(min_distance: 101, max_distance: 400, time_delivery: 6, shipping_company: transportadora)
    search = SearchBudget.create!(height: 1, width: 1, depth: 1, weight: 10, distance: 100, admin: admin)

    login_as(admin, :scope => :admin)
    visit root_path
    click_on '1'
    select 'Entregas Já', from: 'Escolha a transportadora'
    click_on 'Enviar'

    within('.new-order form') do
      expect(page).to have_field "Volume do produto (m³)"
      expect(page).to have_field "Peso do produto (kg)"
      expect(page).to have_field "Distância (km)"
      expect(page).to have_field "Endereço de retirada"
      expect(page).to have_field "Cidade de retirada"
      expect(page).to have_field "Estado de retirada"
      expect(page).to have_field "Endereço de entrega"
      expect(page).to have_field "Cidade de entrega"
      expect(page).to have_field "Estado de entrega"
      expect(page).to have_button "Enviar pedido"
    end
  end
end