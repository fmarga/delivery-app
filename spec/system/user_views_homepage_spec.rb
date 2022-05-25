require 'rails_helper'

describe 'Usuário acessa a página inicial' do
  it 'e vê o título da aplicação' do

    visit root_path

    within('header') do
      expect(page).to have_content 'SISTEMA DE ENTREGAS'
    end
  end

  it 'e vê menu principal de navegação' do

    visit root_path

    expect(page).to have_link 'USUÁRIO'
    expect(page).to have_link 'ADMINISTRADOR'
  end
end