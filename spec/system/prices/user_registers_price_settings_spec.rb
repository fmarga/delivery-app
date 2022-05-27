require 'rails_helper'

describe 'Usuário registra intervalo de preço' do
  it 'com sucesso' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    within('.prices') do
      click_on 'Cadastrar preço'
    end
    fill_in 'Peso mínimo', with: 1
    fill_in 'Peso máximo', with: 5
    fill_in 'Volume mínimo', with: 1
    fill_in 'Volume máximo', with: 10
    fill_in 'Valor por distância', with: 50
    click_on 'Cadastrar'

    expect(page).to have_content 'Intervalo de preço cadastrado com sucesso!'
    within('.prices table') do
      expect(page).to have_content '1 - 5'
      expect(page).to have_content '1 - 10'
      expect(page).to have_content 'R$ 0,50'
    end
  end

  it 'com dados incompletos ou inválidos' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
  
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'
    within('.prices') do
      click_on 'Cadastrar preço'
    end
    fill_in 'Peso mínimo', with: ''
    fill_in 'Peso máximo', with: 5
    fill_in 'Volume mínimo', with: 1
    fill_in 'Volume máximo', with: ''
    fill_in 'Valor por distância', with: 50
    click_on 'Cadastrar'

    expect(page).to have_content 'Peso mínimo (kg) não pode ficar em branco'
    expect(page).to have_content 'Volume máximo (m³) não pode ficar em branco'
  end
end