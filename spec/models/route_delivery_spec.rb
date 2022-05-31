require 'rails_helper'

RSpec.describe RouteDelivery, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando a localização estiver vazia' do
        route = RouteDelivery.new(localization: '', date_and_time: 1.days.ago)

        route.valid?

        expect(route.errors.include?(:localization)).to be true
      end

      it 'falso quando a data e hora estiverem vazios' do
        route = RouteDelivery.new(localization: 'Centro de Triagem', date_and_time: '')

        route.valid?

        expect(route.errors.include?(:date_and_time)).to be true
      end
    end
  end
end
