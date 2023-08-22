require 'rails_helper'

RSpec.describe Orders::CreateOrder do
  let(:order_repository) { class_double(OrdersRepository) }
  let(:costumer_repository) { class_double(CostumersRepository) }
  let(:products_repository) { class_double(ProductsRepository) }
  let(:address_repository) { class_double(AddressRepository) }
  let(:action) do
    described_class.new(
      order_params: params,
      order_repository: order_repository,
      costumer_repository: costumer_repository,
      product_repository: products_repository,
      address_repository: address_repository
    ).perform
  end
  let(:costumer) { build(:costumer) }
  let(:product) { build(:product) }
  let(:address) { build(:address) }

  before do
    allow(order_repository).to receive(:create).and_return(true)
    allow(costumer_repository).to receive(:exists).and_return(true)
    allow(products_repository).to receive(:exists).and_return(true)
    allow(address_repository).to receive(:exists).and_return(true)
  end

  describe '#perform' do
    context 'when all params are valid' do
      let(:params) do
        {
          delivery_date: DateTime.now + 5,
          total_cost: 100,
          shipping_cost: 10,
          quantity: 1,
          costumer_id: costumer.id,
          product_id: product.id,
          address_id: address.id
        }
      end

      it 'should call the repository to save the order' do
        expect(order_repository).to receive(:create).with(params: params)

        action
      end
    end
  end
end
