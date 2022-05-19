require 'rails_helper'

describe 'Usuário acessa página de veículos registrados' do
  it 'a partir da página da transportadora' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'

    expect(page).to have_content 'Transportadora Entregas Já'
    expect(page).to have_content 'CNPJ: 22693970000152'
    expect(page).to have_content 'Localidade: Porto Alegre - RS'
    expect(page).to have_link 'VEÍCULOS REGISTRADOS'
  end

  it 'e acessa detalhes dos veículos' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'VEÍCULOS REGISTRADOS'

    expect(page).to have_content 'Kangoo'
    expect(page).to have_content 'Carga máxima: 700000g'
    expect(page).to have_content 'Sprinter Street'
    expect(page).to have_content 'Carga máxima: 1825000g'
  end

  it 'e não existem veículos' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'VEÍCULOS REGISTRADOS'

    expect(page).to have_content 'Não existem veículos registrados nessa transportadora'
  end
end