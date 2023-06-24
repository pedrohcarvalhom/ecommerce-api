class ProductsController < ApplicationController
  def index
    render json: repository.all, status: 200
  end

  def show
    render json: repository.find(products_params[:id]), status: 200
  end

  def create
    product = Products::CreateProduct.new.perform(products_params.to_h)

    render json: product, status: 200
  end

  def update
    #
  end

  def destroy
    repository.destroy(products_params[:id])

    head :no_content
  end

  private

  def products_params
    params.permit(:id, :title, :subtitle, :number_of_reviews, :price, :quantity, :description, :colors, :category_id, images: [])
  end

  def repository
    ProductsRepository
  end
end
