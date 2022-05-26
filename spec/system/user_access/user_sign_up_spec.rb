require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'USUÁRIO'
    click_on 'Criar uma nova conta'
    fill_in 'E-mail', with: 'fmarga@entregasja.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'fmarga@entregasja.com.br'
    expect(page).to have_button 'SAIR'
  end
end