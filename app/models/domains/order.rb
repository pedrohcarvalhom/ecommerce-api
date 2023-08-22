module Domains
  class Order
    attr_reader :delivery_date, :total_cost, :shipping_cost, :quantity

    def initialize(delivery_date:, total_cost:, shipping_cost:, quantity:)
      @delivery_date = delivery_date
      @total_cost = total_cost
      @shipping_cost = shipping_cost
      @quantity = quantity
    end

    def delivery_valid?
      raise ArgumentError, I18n.t('custom_errors.orders.delivery_date') unless delivery_date.to_datetime > DateTime.now
    end

    def total_cost_valid?
      raise ArgumentError, I18n.t('custom_errors.orders.total_cost') unless total_cost.to_i.positive?
    end
  end
end
