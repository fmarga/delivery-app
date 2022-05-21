require 'rails_helper'

describe 'Usuário vê tabela de preços' do
  it 'a partir da página da transportadora' do
    entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
    
    visit root_path
    click_on 'TRANSPORTADORAS'
    click_on 'Entregas Já'

    within('h3') do
      expect(page).to have_content 'Transportadora Entregas Já'
    end
    within('.prices') do
      expect(page).to have_content 'TABELA DE PREÇOS'
    end
    expect(page).to have_content 'Peso'
    expect(page).to have_content 'Volume'
    expect(page).to have_content 'Preço'
  end

  it 'e vê preços disponíveis' do
  end
end