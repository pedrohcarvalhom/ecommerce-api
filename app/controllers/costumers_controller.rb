class CostumersController < ApplicationController
  def index
    render json: Costumer.all, status: 200
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def costumer_params
    params.permit(:name, :address, :phone, :cpf, :email)
  end
end
