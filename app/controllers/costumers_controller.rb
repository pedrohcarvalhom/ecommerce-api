class CostumersController < ApplicationController
  def index
    render json: Costumer.all, status: 200
  end

  def show
  end

  def create
    costumer = Costumers::CreateCostumer.new(costumer_params: costumer_params.to_h).perform
    render json: costumer
  rescue => e
    render json: e.exception, status: 500
  end

  def update
  end

  def destroy
  end

  private

  def costumer_params
    params.permit(:name, :address, :phone, :cpf, :email, :password)
  end
end
