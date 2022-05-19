require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando placa do veículo estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        kangoo = Vehicle.new(license_plate: '', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)

        result = kangoo.valid?

        expect(result).to eq false
      end

      it 'falso quando a marca do veículo estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        kangoo = Vehicle.new(license_plate: 'LSN4I49', brand: '', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)

        result = kangoo.valid?

        expect(result).to eq false
      end

      it 'falso quando o modelo do veículo estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        kangoo = Vehicle.new(license_plate: 'LSN4I49', brand: 'Renault', model: '', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)

        result = kangoo.valid?

        expect(result).to eq false
      end

      it 'falso quando a capacidade do veículo estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        kangoo = Vehicle.new(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: '', shipping_company: entregas)

        result = kangoo.valid?

        expect(result).to eq false
      end
    end

    context 'uniqueness' do
      it 'falso quando a placa do veículo já estiver em uso' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        kangoo = Vehicle.create(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 700_000, shipping_company: entregas)
        outro_kangoo = Vehicle.new(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2020, capacity: 700_000, shipping_company: entregas)

        result = outro_kangoo.valid?

        expect(result).to eq false
      end
    end

    context 'numericality' do
      it 'falso quando a capacidade não for um número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        kangoo = Vehicle.new(license_plate: 'LSN4I49', brand: 'Renault', model: 'Kangoo', fabrication_year: 2018, capacity: 'a lot', shipping_company: entregas)

        result = kangoo.valid?

        expect(result).to eq false
      end
    end
  end
end
