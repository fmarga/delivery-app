require 'rails_helper'

describe 'Administrador faz busca de orçamentos' do
  it 'através da página inicial' do
    admin = Admin.create!(email: 'admin@sistemadefrete.com.br', password: 'password')

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'Realizar orçamento'

    expect(page).to have_content 'Consulta de preços'
    expect(page).to have_field 'Altura (cm)'
    expect(page).to have_field 'Largura (cm)'
    expect(page).to have_field 'Profundidade (cm)'
    expect(page).to have_field 'Peso (kg)'
    expect(page).to have_field 'Distância (km)'
    expect(page).to have_button 'Buscar'
  end
end