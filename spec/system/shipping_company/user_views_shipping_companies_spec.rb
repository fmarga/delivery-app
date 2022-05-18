require 'rails_helper'

describe 'Usuário acessa página principal de transportadoras' do
  it 'e vê transportadoras cadastradas' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    sc = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

    visit root_path
    within('nav') do
      click_on 'TRANSPORTADORAS'
    end

    expect(current_path).to eq shipping_companies_path
    expect(page).to have_content 'TRANSPORTADORAS PARCEIRAS'
    expect(page).to have_content 'Entregas Já'
    expect(page).to have_content 'Entregas Now!'
  end

  it 'e não existem transportadoras cadastradas' do

    visit root_path
    click_on 'TRANSPORTADORAS'

    expect(page).to have_content 'Não existem transportadoras cadastradas'
  end
end