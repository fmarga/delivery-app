require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do
    User.create!(email: 'teste@gmail.com', password: 'password')

    visit root_path
    click_on 'LOGIN'
    fill_in 'E-mail', with: 'teste@gmail.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'

    expect(page).to have_button 'SAIR'
    expect(page).to have_content 'Login efetuado com sucesso.'
  end

  it 'e faz logout' do
    User.create!(email: 'teste@gmail.com', password: 'password')

    visit root_path
    click_on 'LOGIN'
    fill_in 'E-mail', with: 'teste@gmail.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    click_on 'SAIR'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'LOGIN'
    expect(page).not_to have_button 'SAIR'
    expect(page).not_to have_content 'marga@gmail.com'
  end
end