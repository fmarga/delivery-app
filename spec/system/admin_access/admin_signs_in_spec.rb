require 'rails_helper'

describe 'Administrador se autentica' do
  it 'com sucesso' do
    Admin.create!(email: 'admin@gmail.com', password: 'password', username: 'um_admin')

    visit root_path
    click_on 'ENTRAR COMO ADMINISTRADOR'
    fill_in 'E-mail', with: 'admin@gmail.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'

    expect(page).to have_button 'SAIR'
    expect(page).to have_content 'Login efetuado com sucesso.'
  end 

  it 'e faz logout' do
    Admin.create!(email: 'admin@gmail.com', password: 'password', username: 'um_admin')

    visit root_path
    click_on 'ENTRAR COMO ADMINISTRADOR'
    fill_in 'E-mail', with: 'admin@gmail.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    click_on 'SAIR'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    expect(page).to have_link 'ENTRAR COMO ADMINISTRADOR'
    expect(page).not_to have_button 'SAIR'
  end
end