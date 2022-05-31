require 'rails_helper'

RSpec.describe SearchBudget, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'falso quando peso estiver em branco' do
        search = SearchBudget.new(height: 2, width: 2, depth: 2, weight: '', distance: 150)

        search.valid?

        expect(search.errors.include?(:weight)).to eq true
      end

      it 'falso quando distância estiver em branco' do
        search = SearchBudget.new(height: 2, width: 2, depth: 2, weight: '', distance: '')

        search.valid?

        expect(search.errors.include?(:distance)).to eq true
      end
    end
  end
end
