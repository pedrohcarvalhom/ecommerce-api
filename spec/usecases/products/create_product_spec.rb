require 'rails_helper'

RSpec.describe Products::CreateProduct do
  let(:action) { described_class.new.perform(params) }

  describe '#perform' do
    context 'when all costumer params are valid' do
      let(:category) { create(:category) }
      let(:params) { attributes_for(:product) }

      it 'should return the created product' do
        product = action

        expect(product).to have_attributes(id: be_present)
      end
    end
  end
end
