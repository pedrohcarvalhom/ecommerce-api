class OrdersController < ApplicationController
  def index
    #
  end

  def show
    #
  end

  def create
    order = Orders::CreateOrder.new(order_params: order_params).perform

    render json: order, status: 200
  end

  def update
    #
  end

  def destroy
    #
  end

  private

  def order_params
    params.permit(:id, :delivery_date, :shipping_cost, :total_cost, :quantity, :product_id, :costumer_id, :address_id)
  end
end
