require 'rails_helper'

describe 'Usuário cadastra um novo veículo' do
  it 'com sucesso' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'Cadastrar veículo'
    fill_in 'Placa', with: 'LSN4I49'
    fill_in 'Marca', with: 'Renault'
    fill_in 'Modelo', with: 'Kangoo'
    fill_in 'Ano de fabricação', with: '2018'
    fill_in 'Capacidade', with: '700000'
    click_on 'Cadastrar'

    expect(page).to have_content 'Veículo cadastrado com sucesso'
    expect(page).to have_content 'Renault Kangoo'
    expect(page).to have_content 'Ano de fabricação: 2018'
    expect(page).to have_content 'Carga máxima: 700000g'
  end

  it 'com dados incompletos' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'Cadastrar veículo'
    fill_in 'Placa', with: ''
    fill_in 'Marca', with: 'Renault'
    fill_in 'Modelo', with: ''
    fill_in 'Ano de fabricação', with: '2018'
    fill_in 'Capacidade', with: '700000'
    click_on 'Cadastrar'

    expect(page).to have_content 'Placa não pode ficar em branco'
    expect(page).to have_content 'Modelo não pode ficar em branco'
  end
end