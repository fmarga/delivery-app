require 'rails_helper'

RSpec.describe PriceSetting, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando o campo de volume mínimo estiver vazio' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: '', max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)

        result = price.valid?

        expect(result).to eq false
      end

      it 'falso quando o campo de volume máximo estiver vazio' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: '', min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)

        result = price.valid?

        expect(result).to eq false
      end

      it 'falso quando o campo de peso mínimo estiver vazio' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 5, min_weight: '', max_weight: 10, distance_value: 50, shipping_company: entregas)

        result = price.valid?

        expect(result).to eq false
      end

      it 'falso quando o campo de peso máximo estiver vazio' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: '', distance_value: 50, shipping_company: entregas)

        result = price.valid?

        expect(result).to eq false
      end

      it 'falso quando o campo de valor por distância estiver vazio' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: '', shipping_company: entregas)

        result = price.valid?

        expect(result).to eq false
      end
    end

    context 'numericality' do
      it 'falso quando o campo volume mínimo não for número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 'u', max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)
  
        result = price.valid?
  
        expect(result).to eq false
      end

      it 'falso quando o campo volume máximo não for número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 'l', min_weight: 1, max_weight: 10, distance_value: 50, shipping_company: entregas)
  
        result = price.valid?
  
        expect(result).to eq false
      end

      it 'falso quando o campo peso mínimo não for número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 5, min_weight: 'o', max_weight: 10, distance_value: 50, shipping_company: entregas)
  
        result = price.valid?
  
        expect(result).to eq false
      end

      it 'falso quando o campo peso máximo não for número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 'o', distance_value: 50, shipping_company: entregas)
  
        result = price.valid?
  
        expect(result).to eq false
      end

      it 'falso quando o campo valor por distância não for número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        price = PriceSetting.new(min_volume: 1, max_volume: 5, min_weight: 1, max_weight: 10, distance_value: 'p', shipping_company: entregas)
  
        result = price.valid?
  
        expect(result).to eq false
      end
    end
  end
end
