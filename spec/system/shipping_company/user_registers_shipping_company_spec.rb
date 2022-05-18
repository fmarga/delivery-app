require 'rails_helper'

describe 'Usuário cadastra nova transportadora' do
  it 'a partir da página de transportadoras' do

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'CADASTRAR TRANSPORTADORA'

    expect(page).to have_content 'CADASTRAR NOVA TRANSPORTADORA'
    expect(page).to have_field 'Razão Social'
  end
  # it 'com sucesso' do

  #   visit root_path
  #   click_on 'TRANSPORTADORAS'
  #   within('.section-nav') do
  #     click_on 'CADASTRAR TRANSPORTADORA'
  #   end
  #   within('form') do
  #     fill_in 'Razão Social', with: 'Serviços de Entregas LTDA'
  #     fill_in 'Nome Fantasia', with: 'Entregas Now!'
  #     fill_in 'CNPJ', with: '13053544000163'
  #     fill_in 'Domínio de e-mail', with: 'entregasnow.com.br'
  #     fill_in 'Endereço', with: 'Av do Transporte, 20'
  #     fill_in 'Cidade', with: 'Porto Alegre'
  #     fill_in 'Estado', with: 'RS'
  #     fill_in 'CEP', with: '96493-570'
  #     click_on 'ENVIAR'
  #   end

  #   expect(page).to have_content 'Transportadora cadastrada com sucesso!'
  #   within('h3') do
  #     expect(page).to have_content 'Transportadora Entregas Now!'
  #   end
  #   within('dl') do
  #     expect(page).to have_content 'Razão Social: Serviços de Entregas LTDA'
  #     expect(page).to have_content 'CNPJ: 13053544000163'
  #     expect(page).to have_content 'Endereço: Av do Transporte, 20'
  #     expect(page).to have_content 'Localidade: Porto Alegre - RS'
  #   end
  # end
end