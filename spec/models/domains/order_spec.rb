require 'rails_helper'

RSpec.describe Domains::Order do
  let(:klass) { described_class.new(delivery_date: delivery_date, total_cost: total_cost, shipping_cost: shipping_cost, quantity: quantity) }
  let(:delivery_date) { DateTime.current + 10 }
  let(:total_cost) { 100 }
  let(:shipping_cost) { 20 }
  let(:quantity) { 2 }

  context "given a valid delivery date" do
    it "should not raise a error" do
      expect { klass.delivery_valid? }.not_to raise_error
    end
  end

  context "given a invalid delivery date" do
    let(:delivery_date) { DateTime.current - 10 }

    it "should raise a error" do
      expect { klass.delivery_valid? }.to raise_error(ArgumentError, I18n.t('custom_errors.orders.delivery_date'))
    end
  end

  context "given a valid total cost" do
    it "should not raise a error" do
      expect { klass.total_cost_valid? }.not_to raise_error
    end
  end

  context "given a invalid total cost" do
    let(:total_cost) { 0 }

    it "should raise a error" do
      expect { klass.total_cost_valid? }.to raise_error(ArgumentError, I18n.t('custom_errors.orders.total_cost'))
    end
  end
end
