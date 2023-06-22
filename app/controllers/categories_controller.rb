class CategoriesController < ApplicationController
  def index
    render json: repository.all, status: 200
  end

  def show
    #
  end

  def create
    category = Categories::CreateCategory.new.perform(categories_params.to_h)

    render json: category, status: 200
  end

  def update
    #
  end

  def destroy
    #
  end

  private

  def categories_params
    params.permit(:id, :name, :description)
  end

  def repository
    CategoriesRepository
  end
end
