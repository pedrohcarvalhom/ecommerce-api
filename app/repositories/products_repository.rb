class ProductsRepository
  class << self
    def create_product(params:)
      entity.create!(params)
    end

    def get_product(email)
      entity.find_by_email(email)
    end

    def find(id)
      entity.find(id)
    end

    def destroy(id)
      entity.destroy(id)
    end

    def update(attrs)
      entity.where(id: attrs['id']).update(attrs)
    end

    def all
      entity.all
    end

    private

    def entity
      Product
    end
  end
end
