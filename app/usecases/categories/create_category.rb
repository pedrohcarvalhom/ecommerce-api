module Categories
  class CreateCategory < BaseCategory
    def perform(categories_params)
      @repository.create_category(params: categories_params)
    end
  end
end
