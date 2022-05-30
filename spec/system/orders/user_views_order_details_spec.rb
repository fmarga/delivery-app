require 'rails_helper'

describe 'Usuário da transportadora visualiza detalhes de um pedido' do
  it 'sem estar autenticado' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    order = Order.create!(volume: 1, weight: 10, distance: 100, from_address: 'Av do Estado, 50', from_city: 'Porto Alegre', from_state: 'RS', to_address: 'Av do Forte, 9000', to_city: 'São Leopoldo', to_state: 'RS', value: 5, recipient_name: 'Tutti', estimated_delivery_time: 2)
    
    visit shipping_companies_path(@entregas)

    expect(page).to have_content 'Para continuar, faça login ou registre-se.'
  end

  it 'com sucesso' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    order = Order.create!(volume: 1, weight: 10, distance: 100, from_address: 'Av do Estado, 50', from_city: 'Porto Alegre', from_state: 'RS', to_address: 'Av do Forte, 9000', to_city: 'São Leopoldo', to_state: 'RS', value: 5, recipient_name: 'Tutti', estimated_delivery_time: 2, shipping_company: entregas)

    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    click_on 'PEDIDOS'
    click_on order.code

    expect(current_path).to eq order_path(1)
  end
end