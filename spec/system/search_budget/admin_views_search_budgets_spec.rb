require 'rails_helper'

describe 'Administrador acessa lista de orçamentos realizados' do
  it 'a partir da página inicial' do
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
    first_search = SearchBudget.create!(height: 1, width: 1, depth: 1, weight: 10, distance: 100, admin: admin)
    second_search = SearchBudget.create!(height: 2, width: 2, depth: 2, weight: 15, distance: 150, admin: admin)

    login_as(admin, :scope => :admin)
    visit root_path

    expect(page).to have_content 'ORÇAMENTOS ANTERIORES:'
    within('table') do
      expect(page).to have_content 'No. da busca'
      expect(page).to have_link '1'
      expect(page).to have_link '2'
      expect(page).to have_content 'Pessoa responsável'
      expect(page).to have_content 'admin@sistemadefrete.com.br'
    end
  end

  it 'e não existem pesquisas anteriores' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')

    login_as(admin, :scope => :admin)
    visit root_path

    expect(page).to have_content 'Não existem orçamentos realizados'
  end
end