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

    within('nav')do
      expect(page).to have_link 'INÍCIO'
      expect(page).to have_link 'TRANSPORTADORAS'
      expect(page).to have_link 'LOGIN'
    end
  end
end