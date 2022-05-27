require 'rails_helper'

describe 'Usuário acessa página da transportadora' do
  it 'e vê veículos cadastrados' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    kangoo = Vehicle.create!(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
    sprinter = Vehicle.create!(license_plate: 'BDB1B52', brand: 'Mercedes-Benz', model: 'Sprinter Street', fabrication_year: 2021, capacity: 1_825_000, shipping_company: entregas)
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'

    within('.vehicles table') do
      expect(page).to have_content 'Renault'
      expect(page).to have_content 'Kangoo'
      expect(page).to have_content '2018'
      expect(page).to have_content 'Mercedes-Benz'
      expect(page).to have_content 'Sprinter Street'
      expect(page).to have_content '2021'
    end
  end

  it 'e não existem veículos registrados' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'email@entregasja.com.br', password: 'password')
    
    login_as(user, :scope => :user)
    visit root_path
    click_on 'Entregas Já'

    expect(page).to have_content 'Não existem veículos registrados'
  end
end