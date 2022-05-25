require 'rails_helper'

describe 'Usuário vê detalhes de uma transportadora' do
  it 'e vê informações adicionais' do
    admin = Admin.create!(email: 'admin@gmail.com', password: 'password', username: 'admin')
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    sc = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

    login_as(admin, :scope => :admin)
    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'

    expect(page).to have_content 'Transportadora Entregas Já'
    expect(page).to have_content 'Razão Social: Transportes e Logística LTDA'
    expect(page).to have_content 'CNPJ: 22693970000152'
    expect(page).to have_content 'Endereço: Av do Transporte, 10'
    expect(page).to have_content 'Localidade: Porto Alegre - RS'
  end

  it 'e volta para página index de transportadoras' do
    admin = Admin.create!(email: 'admin@gmail.com', password: 'password', username: 'admin')
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    sc = ShippingCompany.create!(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')
  
    login_as(admin)
    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'
    click_on 'VOLTAR'

    expect(current_path).to eq shipping_companies_path
  end
end