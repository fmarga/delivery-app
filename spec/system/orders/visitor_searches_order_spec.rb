require 'rails_helper'

describe 'Visitante acessa dados do seu pedido' do
  it 'na tela inicial' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av. do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av. do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas, vehicle: kangoo, status: 5)
    RouteDelivery.create!(localization: 'Centro de Triagem de Osasco', date_and_time: 2.days.ago, order: order)
    RouteDelivery.create!(localization: 'Centro de Triagem de Madureira', date_and_time: 1.days.ago, order: order)

    visit root_path
    fill_in 'Código da busca', with: order.code
    click_on 'PESQUISAR'

    expect(page).to have_content "Pedido no. #{order.code}"
    expect(page).to have_content "Transportadora: Entregas Já"
    expect(page).to have_content "Endereço de origem: Av. do Estado, 50 - São Paulo(SP)"
    expect(page).to have_content "Endereço de destino: Av. do Forte, 9000 - Rio de Janeiro(RJ)"
    expect(page).to have_content 'Localização do pedido:' 
    within('table') do
      expect(page).to have_content 'Localização'
      expect(page).to have_content 'Centro de Triagem de Osasco'
      expect(page).to have_content 'Centro de Triagem de Madureira'
      expect(page).to have_content 'Data e hora'
    end
  end

  it 'e seu pedido foi entregue' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av. do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av. do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas, vehicle: kangoo, status: 15)
    RouteDelivery.create!(localization: 'Centro de Triagem de Osasco', date_and_time: 2.days.ago, order: order)
    RouteDelivery.create!(localization: 'Centro de Triagem de Madureira', date_and_time: 1.days.ago, order: order)

    visit root_path
    fill_in 'Código da busca', with: order.code
    click_on 'PESQUISAR'

    expect(page).to have_content "Pedido entregue e finalizado com sucesso"
  end

  it 'e informa um código incorreto' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av. do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av. do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas, vehicle: kangoo, status: 15)
    RouteDelivery.create!(localization: 'Centro de Triagem de Osasco', date_and_time: 2.days.ago, order: order)
    RouteDelivery.create!(localization: 'Centro de Triagem de Madureira', date_and_time: 1.days.ago, order: order)

    visit root_path
    fill_in 'Código da busca', with: 'ABCDEF123456789'
    click_on 'PESQUISAR'

    expect(page).to have_content 'Código informado é inválido'
    expect(current_path).to eq root_path
  end
end