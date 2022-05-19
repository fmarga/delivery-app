require 'rails_helper'

describe 'Usuário vê página de detalhes de um veículo' do
  it 'e vê informações adicionais' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)

    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'VEÍCULOS REGISTRADOS'
    click_on 'Kangoo'

    within('h3') do
      expect(page).to have_content 'Renault Kangoo'
    end
    within('dl') do
      expect(page).to have_content 'Ano de fabricação: 2018'
      expect(page).to have_content 'Carga máxima: 700000g'
      expect(page).to have_content 'Placa: LSN4I49'
    end
  end
end