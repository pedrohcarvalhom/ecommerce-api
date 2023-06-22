module Categories
  class BaseCategory
    def initialize(repository: CategoriesRepository)
      @repository = repository
    end
  end
end
