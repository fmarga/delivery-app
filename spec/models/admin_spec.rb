require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '#valid?' do
    context 'format' do
      it 'falso quando domínio de e-mail não é @sistemadefrete.com.br' do
        admin = Admin.new(email: 'admin@outrodominio.com.br', password: 'password')

        result = admin.valid?
        
        expect(result).to eq false
      end
    end
  end
end
