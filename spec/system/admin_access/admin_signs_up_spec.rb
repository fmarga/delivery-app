require 'rails_helper'

describe 'Administrador se cadastra' do
  it 'com sucesso' do

    visit root_path
    click_on 'ADMINISTRADOR'
    click_on 'Criar uma nova conta'
    fill_in 'E-mail', with: 'admin@sistemadefrete.com.br'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_button 'SAIR'
  end

  it 'com e-mail inválido' do
    visit root_path
    click_on 'ADMINISTRADOR'
    click_on 'Criar uma nova conta'
    fill_in 'E-mail', with: 'admin@gmail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Não foi possível salvar administrador: 1 erro'
    expect(page).to have_content 'E-mail não é válido'
  end
end