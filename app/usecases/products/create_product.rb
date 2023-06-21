module Products
  class CreateProduct < BaseProduct
    def perform(products_params)
      @repository.create_product(params: products_params)
    end
  end
end