require 'rails_helper'

RSpec.describe ShippingCompany, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando razão social estiver em branco' do
        entregas = ShippingCompany.new(corporate_name: '', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

        result = entregas.valid?

        expect(result).to eq false
      end

      it 'falso quando nome fantasia estiver em branco' do
        entregas = ShippingCompany.new(corporate_name: 'Transporte e Logística LTDA', brand_name: '', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

        result = entregas.valid?

        expect(result).to eq false
      end

      it 'falso quando CNPJ estiver em branco' do
        entregas = ShippingCompany.new(corporate_name: 'Transporte e Logística LTDA', brand_name: 'Entregas Já', registration_number: '', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

        result = entregas.valid?

        expect(result).to eq false
      end

      it 'falso quando domínio de e-mail estiver em branco' do
        entregas = ShippingCompany.new(corporate_name: 'Transporte e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: '', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

        result = entregas.valid?

        expect(result).to eq false
      end
    end

    context 'uniqueness' do
      it 'falso quando CNPJ já está em uso' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        sc = ShippingCompany.new(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '22693970000152', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

        result = sc.valid?

        expect(result).to eq false
      end

      it 'falso quando domínio de e-mail já está em uso' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        sc = ShippingCompany.new(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

        result = sc.valid?

        expect(result).to eq false
      end

      it 'falso quando CEP já está em uso' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
        sc = ShippingCompany.new(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '13053544000163', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

        result = sc.valid?

        expect(result).to eq false
      end
    end

    context 'length' do
      it 'falso quando o CNPJ tem menos de 14 caracteres' do
        sc = ShippingCompany.new(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '2269397000015', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

        result = sc.valid?

        expect(result).to eq false
      end

      it 'falso quando o CNPJ tem mais de 14 caracteres' do
        sc = ShippingCompany.new(corporate_name: 'Serviços de Entregas LTDA', brand_name: 'Entregas Now!', registration_number: '226939700001598', email_domain: 'entregasnow.com.br', address: 'Av do Transporte, 20', city: 'Porto Alegre', state: 'RS', postal_code: '96493-570')

        result = sc.valid?

        expect(result).to eq false
      end
    end

    context 'numericality' do
      it 'falso quando CNPJ não contém somente números' do
        entregas = ShippingCompany.create(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '226939700001A2', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')

        result = entregas.valid?

        expect(result).to eq false
      end
    end

    context 'format' do
      it 'falso quando o CEP tem menos do que 8 dígitos' do
        entregas = ShippingCompany.new(corporate_name: 'Transportes e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-39')

        result = entregas.valid?

        expect(result).to eq false
      end
    end
  end
end
