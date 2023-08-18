require 'rails_helper'

RSpec.describe Login::LoginCostumer do
  let(:costumer_repository) { class_double(CostumersRepository) }
  let(:email) { "pedro@gmail.com" }
  let(:password) { "123456" }
  let(:action) {
    described_class.new(email, password, costumer_repository: costumer_repository).execute
  }
  let(:costumer) { build_stubbed(:costumer) }

  before do
    allow(costumer_repository).to receive(:authenticate_costumer).and_return(true)
    allow(costumer_repository).to receive(:get_costumer).and_return(costumer)
  end

  after { action }

  it "calls the authenticate_costumer method" do
    expect(costumer_repository).to receive(:authenticate_costumer).once.with(email, password)
  end

  it "returns the costumer" do
    expect(costumer_repository).to receive(:get_costumer).with(email).once
  end
end
