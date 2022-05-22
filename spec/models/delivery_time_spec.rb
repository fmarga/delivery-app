require 'rails_helper'

RSpec.describe DeliveryTime, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando distância mínima estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: '', max_distance: 100, time_delivery: 2, shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end

      it 'falso quando distância máxima estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 1, max_distance: '', time_delivery: 2, shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end

      it 'falso quando prazo estiver em branco' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 1, max_distance: 100, time_delivery: '', shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end
    end

    context 'numericality' do
      it 'falso quando distância mínima não for um número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 'e', max_distance: 100, time_delivery: 2, shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end

      it 'falso quando distância máxima não for um número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 1, max_distance: 'o', time_delivery: 2, shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end

      it 'falso quando prazo não for um número' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 1, max_distance: 100, time_delivery: 'i', shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end

      it 'falso quando prazo for menor que zero' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 1, max_distance: 100, time_delivery: -2, shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end
    end

    context 'comparison' do
      it 'falso quando a distância máxima for menor que a distância mínima' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        delivery = DeliveryTime.new(min_distance: 100, max_distance: 99, time_delivery: 2, shipping_company: entregas)

        result = delivery.valid?

        expect(result).to eq false
      end
    end
  end
end
