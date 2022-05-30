require 'rails_helper'

describe 'Usuário atualiza status de um pedido' do
  it 'e aceita-o com sucesso' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas)

    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    click_on 'PEDIDOS'
    click_on order.code
    select 'Sprinter Street', from: 'Veículos disponíveis'
    click_on 'ACEITAR'

    expect(current_path).to eq order_path(1)
    expect(page).to have_content 'Status do Pedido: Aceito'
    expect(page).to have_content 'Veículo responsável: Sprinter Street - BDB1B52'
  end

  it 'e o rejeita' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas)
  
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    click_on 'PEDIDOS'
    click_on order.code
    click_on 'RECUSAR'

    expect(current_path).to eq order_path(1)
    expect(page).to have_content 'Status do Pedido: Recusado'
  end

  it 'e o finaliza' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas, vehicle: kangoo, status: 5)
  
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    click_on 'PEDIDOS'
    click_on order.code
    click_on 'FINALIZAR'

    expect(current_path).to eq order_path(1)
    expect(page).to have_content 'Status do Pedido: Finalizado'
  end
end