class ProductsRepository < BaseRepository
  class << self

    def all
      entity.all
    end

    private

    def entity
      Product
    end
  end
end
