require 'rails_helper'

describe 'Usuário cadastra intervalo de prazo de entrega' do
  it 'com sucesso' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    within('.delivery_time') do
      click_on 'Cadastrar prazo'
    end
    fill_in 'Distância mínima', with: 1
    fill_in 'Distância máxima', with: 100
    fill_in 'Prazo', with: 2
    click_on 'Cadastrar'

    expect(page).to have_content 'Intervalo de prazo de entrega cadastrado com sucesso!'
    within('.delivery_time') do
      expect(page).to have_content 'Distância (km)'
      expect(page).to have_content 'Prazo (dias úteis)'
      expect(page).to have_content '1 - 100'
      expect(page).to have_content '2'
    end
  end

  it 'com dados incompletos ou inválidos' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'Cadastrar prazo'
    fill_in 'Distância mínima', with: ''
    fill_in 'Distância máxima', with: 100
    fill_in 'Prazo', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content 'Distância mínima não pode ficar em branco'
    expect(page).to have_content 'Prazo não pode ficar em branco'
  end
end