class CategoriesRepository
  class << self
    def create_category(*attrs)
      entity.create!(attrs)
    end

    def get_category_by_name(category_name)
      entity.select(:id, :name).find_by("name ILIKE ?", category_name)
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
      Category
    end
  end
end
