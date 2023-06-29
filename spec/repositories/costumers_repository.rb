require 'rails_helper'

RSpec.describe CostumersRepository do
  let(:costumer) { create :costumer }

  describe '#create_costumer' do
    context 'when params are valid' do
      let(:costumer_params) { attributes_for(:costumer) }

      it 'creates a costumer' do
        created_costumer = described_class.create(params: costumer_params)

        expect(created_costumer).to be_persisted
      end
    end
  end

  describe '#find' do
    context 'when params are valid' do
      it 'returns a costumer' do
        described_class.find(costumer.id)

        expect(costumer).not_to be_nil
      end
    end
  end

  describe '#destroy' do
    context 'when params are valid' do
      it 'destroy the costumer' do
        expect { described_class.destroy(costumer.id) }.not_to raise_error
      end
    end
  end

  describe '#update' do
    context 'when params are valid' do
      let(:new_costumer_params) do
        {
          id: costumer.id,
          name: 'pedro m'
        }
      end

      it 'updates the costumer' do
        updated_costumer = described_class.update(new_costumer_params)

        expect(updated_costumer.first.name).to eq(new_costumer_params[:name])
      end
    end
  end

  describe '#cpf_registered?' do
    it 'returns true if the cpf is already registered' do
      action = described_class.cpf_registered?(costumer.cpf)
      expect(action).to be_truthy
    end
  end

  describe '#email_registered?' do
    it 'returns true if the email is already registered' do
      action = described_class.email_registered?(costumer.email)
      expect(action).to be_truthy
    end
  end

  describe '#get_costumer' do
    it 'returns the costumer by the email registered' do
      returned_costumer = described_class.get_costumer(costumer.email)
      expect(returned_costumer).to eq(costumer)
    end
  end
end
