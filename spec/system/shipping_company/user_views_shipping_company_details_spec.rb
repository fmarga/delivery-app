require 'rails_helper'

describe 'Usuário vê página de detalhes da transportadora' do
  it 'da transportadora a que está vinculado' do
    entregas = ShippingCompany.create!(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    user = User.create!(email: 'usuario@entregasja;com.br', password: 'password', shipping_company: entregas)

    login_as(user)
    visit root_path


  end
end