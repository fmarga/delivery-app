require 'rails_helper'

describe 'Administrador acessa área de pedidos' do
  it 'e vê pedidos cadastrados' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)
    PriceSetting.create!(min_volume: 6, max_volume: 10, min_weight: 11, max_weight: 30, distance_value: 80, shipping_company: entregas)
    DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: entregas)
    DeliveryTime.create!(min_distance: 101, max_distance: 500, time_delivery: 5, shipping_company: entregas)
    first_kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sc = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 80, shipping_company: sc)
    PriceSetting.create!(min_volume: 6, max_volume: 15, min_weight: 11, max_weight: 20, distance_value: 100, shipping_company: sc)
    DeliveryTime.create!(min_distance: 1, max_distance: 200, time_delivery: 3, shipping_company: sc)
    DeliveryTime.create!(min_distance: 201, max_distance: 400, time_delivery: 6, shipping_company: sc)
    second_kangoo = Vehicle.create!(license_plate: 'LAN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2019, capacity: 700_000, shipping_company: entregas)
    SearchBudget.create!(height: 1, width: 1, depth: 1, weight: 10, distance: 100, admin: admin)
    allow(SecureRandom).to receive(:alphanumeric).and_return('OTCDEFW23456789')
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av. do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av. do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas, vehicle: first_kangoo, status: 5)
    allow(SecureRandom).to receive(:alphanumeric).and_return('OTCDEFW25056789')
    second_order = Order.create!(volume: 1, weight: 10, distance: 100, from_address: 'Av. do Estado, 90', from_city: 'Porto Alegre', from_state: 'RS', to_address: 'Av. Beira-Mar, 1000', to_city: 'Florianópolis', to_state: 'SC', value: 5, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: sc, vehicle: second_kangoo, status: 5)

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Pedidos cadastrados'

    expect(current_path).to eq orders_path
    expect(page).to have_content 'Pedido no.'
    expect(page).to have_content 'OTCDEFW23456789'
    expect(page).to have_content 'OTCDEFW25056789'
    expect(page).to have_content 'Transportadora responsável'
    expect(page).to have_content 'Status'
  end

  it 'e não existem pedidos cadastrados' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Pedidos cadastrados'

    expect(page).to have_content 'Não existem pedidos cadastrados'
  end

  it 'e acessa um pedido específico' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)
    PriceSetting.create!(min_volume: 6, max_volume: 10, min_weight: 11, max_weight: 30, distance_value: 80, shipping_company: entregas)
    DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: entregas)
    DeliveryTime.create!(min_distance: 101, max_distance: 500, time_delivery: 5, shipping_company: entregas)
    first_kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sc = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')
    PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 80, shipping_company: sc)
    PriceSetting.create!(min_volume: 6, max_volume: 15, min_weight: 11, max_weight: 20, distance_value: 100, shipping_company: sc)
    DeliveryTime.create!(min_distance: 1, max_distance: 200, time_delivery: 3, shipping_company: sc)
    DeliveryTime.create!(min_distance: 201, max_distance: 400, time_delivery: 6, shipping_company: sc)
    second_kangoo = Vehicle.create!(license_plate: 'LAN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2019, capacity: 700_000, shipping_company: entregas)
    SearchBudget.create!(height: 1, width: 1, depth: 1, weight: 10, distance: 100, admin: admin)
    allow(SecureRandom).to receive(:alphanumeric).and_return('OTCDEFW23456789')
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av. do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av. do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas, vehicle: first_kangoo, status: 5)
    allow(SecureRandom).to receive(:alphanumeric).and_return('OTCDEFW25056789')
    second_order = Order.create!(volume: 1, weight: 10, distance: 100, from_address: 'Av. do Estado, 90', from_city: 'Porto Alegre', from_state: 'RS', to_address: 'Av. Beira-Mar, 1000', to_city: 'Florianópolis', to_state: 'SC', value: 5, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: sc, vehicle: second_kangoo, status: 5)

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Pedidos cadastrados'
    click_on 'OTCDEFW25056789'

    expect(current_path).to eq order_path(second_order)
    expect(page).to have_content 'Pedido no. OTCDEFW25056789'
    expect(page).to have_content 'Transportadora: Entregas Now!'
    expect(page).to have_content 'Endereço de saída: Av. do Estado, 90 - Porto Alegre(RS)'
  end
end