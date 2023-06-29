require 'rails_helper'

RSpec.describe Costumers::CreateCostumer do
  let(:action) { described_class.new(costumer_params: params) }

  describe '#perform' do
    context 'when all costumer params are valid' do
      let(:params) { attributes_for(:costumer) }
      let(:address_attr) { attributes_for(:address) }

      it 'should return the created costumer with address' do
        params[:address] = address_attr
        costumer = action.perform

        expect(costumer.first).to have_attributes(id: be_present)
        expect(costumer.first.address).to have_attributes(id: be_present)
      end
    end

    context 'when one param of the costumer is missing' do
      let(:params) { attributes_for(:costumer) }

      it 'should raise an ArgumentError' do
        params[:email] = ''

        expect { action.perform }.to raise_error(ArgumentError)
      end
    end
  end
end
