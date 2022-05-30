require 'rails_helper'

describe 'Usuário vê pedidos da sua transportadora' do
  it 'sem se autenticar' do
    visit orders_path

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end

  it 'e não existem pedidos cadastrados' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')

    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    click_on 'PEDIDOS'

    expect(page).to have_content 'Não existem pedidos para essa transportadora'
  end

  it 'com sucesso' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    allow(SecureRandom).to receive(:alphanumeric).and_return('ABCDEF123456789')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    first_order = Order.create!(volume: 1, weight: 10, distance: 100, from_address: 'Av do Estado, 50', from_city: 'Porto Alegre', from_state: 'RS', to_address: 'Av do Forte, 9000', to_city: 'São Leopoldo', to_state: 'RS', value: 5, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas)
    allow(SecureRandom).to receive(:alphanumeric).and_return('OTCDEFW23456789')
    second_order = Order.create!(volume: 4, weight: 20, distance: 100, from_address: 'Av do Estado, 50', from_city: 'São Paulo', from_state: 'SP', to_address: 'Av do Forte, 9000', to_city: 'Rio de Janeiro', to_state: 'RJ', value: 10, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas)

    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    click_on 'PEDIDOS'

    expect(page).to have_content 'Pedidos para Entregas Já'
    expect(page).to have_content 'Código'
    expect(page).to have_content 'Data de criação'
    expect(page).to have_content 'Status'
    expect(page).to have_content 'ABCDEF123456789'
    expect(page).to have_content 'OTCDEFW23456789'
  end
end