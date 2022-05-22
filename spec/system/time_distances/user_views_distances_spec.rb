require 'rails_helper'

describe 'Usuário vê área de prazos' do
  it 'e vê tabela de prazos de entrega' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    delivery = DeliveryTime.create!(min_distance: 1, max_distance: 100, time_delivery: 2, shipping_company: entregas)

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'

    expect(page).to have_content 'TABELA DE PRAZOS'
    within('.delivery_time') do
      expect(page).to have_content 'Distância (km)'
      expect(page).to have_content 'Prazo (dias úteis)'
      expect(page).to have_content '1 - 100'
      expect(page).to have_content '2'
    end
  end

  it 'e não existem prazos cadastrados' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'

    within('.delivery_time') do
      expect(page).to have_content 'Não existem prazos de entrega cadastrados'
    end
  end
end