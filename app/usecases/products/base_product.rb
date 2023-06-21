module Products
  class BaseProduct
    def initialize(repository: ProductsRepository)
      @repository = repository
    end
  end
end