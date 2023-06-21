class ProductsController < ApplicationController
  def index
    render json: repository.all, status: 200
  end

  def show
    #
  end

  def create
    #
  end

  def update
    #
  end

  def destroy
    #
  end

  private

  def products_params
    params.permit(:id, :title, :subtitle, :number_of_reviews, :price, :quantity, :description, :colors)
  end

  def repository
    ProductsRepository
  end
end
