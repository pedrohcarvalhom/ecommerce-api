module Products
  class CreateProduct < BaseProduct
    def perform(products_params)
      @repository.create(params: products_params)
    end
  end
end
