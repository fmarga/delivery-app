require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'gera um código aleatório' do
    it 'ao criar um novo pedido' do
      admin = Admin.create(email: 'teste@sistemadefrete.com.br', password: 'password')
      entregas = ShippingCompany.create(corporate_name: 'Transporte e Logística LTDA', brand_name: 'Entregas Já', registration_number: '22693970000152', email_domain: 'entregasja.com.br', address: 'Av do Transporte, 10', city: 'Porto Alegre', state: 'RS', postal_code: '96224-390')
      order = Order.new(volume: 1, weight: 10, distance: 100, from_address: 'Av do Estado, 50', from_city: 'Porto Alegre', from_state: 'RS', to_address: 'Av do Forte, 9000', to_city: 'São Leopoldo', to_state: 'RS', value: 5, recipient_name: 'Tutti', estimated_delivery_time: 2)
      
      order.save!

      expect(order.code).not_to be_empty
    end
  end

  describe '#valid?' do
    context 'numericality' do
      it 'falso quando volume for menor ou igual a zero' do
        order = Order.new(volume: '', weight: 20, distance: 100, value: 10)

        order.valid?

        expect(order.errors.include?(:volume)).to be true
      end

      it 'falso quando peso for menor ou igual a zero' do
        order = Order.new(volume: 1, weight: '', distance: 100, value: 10)

        order.valid?

        expect(order.errors.include?(:weight)).to be true
      end

      it 'falso quando peso for menor ou igual a zero' do
        order = Order.new(volume: 1, weight: 20, distance: '', value: 10)

        order.valid?

        expect(order.errors.include?(:distance)).to be true
      end

      it 'falso quando peso for menor ou igual a zero' do
        order = Order.new(volume: 1, weight: 20, distance: 150, value: '')

        order.valid?

        expect(order.errors.include?(:value)).to be true
      end
    end
  end
end
