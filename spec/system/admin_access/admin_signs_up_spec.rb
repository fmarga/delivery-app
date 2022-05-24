require 'rails_helper'

describe 'Administrador se cadastra' do
  it 'com sucesso' do

    visit root_path
    click_on 'ADMINISTRADOR'
    click_on 'Criar uma nova conta'
    fill_in 'Nome de usuário', with: 'fmarga'
    fill_in 'E-mail', with: 'admin@gmail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'fmarga'
    expect(page).to have_button 'SAIR'
  end
end