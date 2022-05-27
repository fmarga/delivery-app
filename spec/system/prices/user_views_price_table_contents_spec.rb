require 'rails_helper'

describe 'Usuário vê área de preços' do
  it 'a partir da página da transportadora' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'

    within('h1') do
      expect(page).to have_content 'Transportadora Entregas Já'
    end
    within('.prices') do
      expect(page).to have_content 'TABELA DE PREÇOS'
    end
    expect(page).to have_content 'Peso (kg)'
    expect(page).to have_content 'Volume (m³)'
    expect(page).to have_content 'Preço/km'
  end

  it 'e vê tabela de preços disponíveis' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    first_price = PriceSetting.create!(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)
    second_price = PriceSetting.create!(min_volume: 6, max_volume: 10, min_weight: 11, max_weight: 30, distance_value: 80, shipping_company: entregas)
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'

    expect(page).to have_content 'TABELA DE PREÇOS'
    within('.prices table') do
      expect(page).to have_content 'Peso (kg)'
      expect(page).to have_content 'Volume (m³)'
      expect(page).to have_content 'Preço/km'
      expect(page).to have_content '1 - 10'
      expect(page).to have_content '1 - 5'
      expect(page).to have_content 'R$ 0,50'
      expect(page).to have_content '11 - 30'
      expect(page).to have_content '6 - 10'
      expect(page).to have_content 'R$ 0,80'
    end
  end

  it 'e não existem preços cadastrados' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'

    expect(page).to have_content 'TABELA DE PREÇOS'
    expect(page).to have_content 'Não existem valores cadastrados'
  end
end