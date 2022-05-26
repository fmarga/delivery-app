require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    User.create!(email: 'teste@entregasja.com.br', password: 'password')

    visit root_path
    click_on 'USUÁRIO'
    fill_in 'E-mail', with: 'teste@entregasja.com.br'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'

    expect(page).to have_button 'SAIR'
    expect(page).to have_content 'Login efetuado com sucesso.'
  end

  it 'e faz logout' do
    ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    User.create!(email: 'teste@entregasja.com.br', password: 'password')

    visit root_path
    click_on 'USUÁRIO'
    fill_in 'E-mail', with: 'teste@entregasja.com.br'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    click_on 'SAIR'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'USUÁRIO'
    expect(page).not_to have_button 'SAIR'
    expect(page).not_to have_content 'marga@gmail.com'
  end
end