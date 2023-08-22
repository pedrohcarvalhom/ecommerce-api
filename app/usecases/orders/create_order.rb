module Orders
  class CreateOrder
    attr_reader :order_params, :order_repository, :costumer_repository, :product_repository, :address_repository

    def initialize(
      order_params:,
      order_repository: OrdersRepository,
      costumer_repository: CostumersRepository,
      product_repository: ProductsRepository,
      address_repository: AddressRepository
    )

      @order_params = order_params
      @order_repository = order_repository
      @costumer_repository = costumer_repository
      @product_repository = product_repository
      @address_repository = address_repository
    end

    def perform
      order = assign_order_model

      validate_order(order)
      validate_mandatory_relations
      create_order
    end

    private

    def assign_order_model
      Domains::Order.new(
        delivery_date: order_params[:delivery_date],
        total_cost: order_params[:total_cost],
        shipping_cost: order_params[:shipping_cost],
        quantity: order_params[:quantity]
      )
    end

    def validate_order(order)
      order.delivery_valid?
      order.total_cost_valid?
    end

    def validate_mandatory_relations
      raise ValidationError unless relations_exists?
    end

    def relations_exists?
      costumer_repository.exists(order_params[:costumer_id]) &&
        product_repository.exists(order_params[:product_id]) &&
        address_repository.exists(order_params[:address_id])
    end

    def create_order
      order_repository.create(params: order_params)
    end
  end
end
