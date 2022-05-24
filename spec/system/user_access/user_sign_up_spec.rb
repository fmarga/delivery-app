require 'rails_helper'

describe 'Usuário se autentica' do
  it 'com sucesso' do

    visit root_path
    click_on 'USUÁRIO'
    click_on 'Criar uma nova conta'
    fill_in 'E-mail', with: 'fmarga@gmail.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'fmarga@gmail.com'
    expect(page).to have_button 'SAIR'
  end
end