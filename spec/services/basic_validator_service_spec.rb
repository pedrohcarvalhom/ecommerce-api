require 'rails_helper'

RSpec.describe BasicValidatorService do
  describe '#validate lengths' do
    context 'when param length is valid' do
      it 'should not raise any error' do
        expect { described_class.validate_length('pedro', :name, 3) }.not_to raise_error
      end
    end

    context 'when some parameters are invalid' do
      it 'raises an ArgumentError' do
        expect { described_class.validate_length('pe', :name, 3) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#validate_presence' do
    let(:costumer_params) { attributes_for(:costumer) }

    context 'when all parameters are present' do
      it 'does not raise any error' do
        expect { described_class.validate_presence(costumer_params) }.not_to raise_error
      end
    end

    context 'when some parameter is missing' do
      it 'raises ArgumentError' do
        costumer_params[:name] = ''
        expect { described_class.validate_presence(costumer_params) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#validate_cpf' do
    context 'when cpf is valid' do
      let(:valid_cpf) { 67562944075 }
      it 'does not raise any error' do
        expect { described_class.validate_cpf(valid_cpf) }.not_to raise_error
      end
    end

    context 'when cpf is invalid' do
      let(:invalid_cpf) { 1234567890 }

      it 'raises ArgumentError' do
        expect { described_class.validate_cpf(invalid_cpf) }.to raise_error(ArgumentError)
      end
    end
  end
end
