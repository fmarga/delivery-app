require 'rails_helper'

describe 'Administrador faz busca de orçamentos' do
  it 'através da página inicial' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Realizar orçamento'

    expect(page).to have_content 'Consulta de preços'
    expect(page).to have_field 'Altura (m)'
    expect(page).to have_field 'Largura (m)'
    expect(page).to have_field 'Profundidade (m)'
    expect(page).to have_field 'Peso (kg)'
    expect(page).to have_field 'Distância (km)'
    expect(page).to have_button 'Enviar'
  end

  it 'com sucesso' do
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

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Realizar orçamento'
    fill_in 'Altura (m)', with: 1
    fill_in 'Largura (m)', with: 1
    fill_in 'Profundidade (m)', with: 1
    fill_in 'Peso (kg)', with: 10
    fill_in 'Distância (km)', with: 200
    click_on 'Enviar'

    expect(page).to have_content 'Pesquisa realizada com sucesso'
    expect(page).to have_content 'Consulta de preço número:'
    expect(page).to have_content 'Volume - 1,00 m³'
    expect(page).to have_content 'Peso - 10,0 kg'
    expect(page).to have_content 'Distância - 200km'
    within('table') do
      expect(page).to have_content 'Transportadora'
      expect(page).to have_content 'Prazo (dias úteis)'
      expect(page).to have_content 'Valor R$'
    end
  end

  it 'e não há transportadoras que cumpram com os requisitos' do
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

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Realizar orçamento'
    fill_in 'Altura (m)', with: 50
    fill_in 'Largura (m)', with: 50
    fill_in 'Profundidade (m)', with: 50
    fill_in 'Peso (kg)', with: 900
    fill_in 'Distância (km)', with: 200
    click_on 'Enviar'

    expect(page).to have_content 'Pesquisa realizada com sucesso'
    expect(page).to have_content 'Consulta de preço número:'
    expect(page).to have_content 'Volume - 125.000 m³'
    expect(page).to have_content 'Peso - 900 kg'
    expect(page).to have_content 'Distância - 200km'
    expect(page).to have_content 'Não existem transportadoras disponíveis para o seu pedido'
  end
end