class CostumersController < ApplicationController
  before_action :authenticate_costumer, only: %i[update delete]

  def_param_group :create_costumer_params do
    param :name, String, 'Name of the costumer', required: true
    param :address, String, 'Address of the costumer', required: true
    param :phone, String, 'Phone of the costumer', required: true
    param :cpf, String, 'CPF of the costumer', required: true
    param :email, String, 'Email of the costumer', required: true
    param :password, String, 'Password of the costumer', required: true
  end

  def_param_group :update_costumer_params do
    param :id, String, 'ID of the created costumer', required: true
    param :name, String, 'Name of the costumer', required: false
    param :address, String, 'Address of the costumer', required: false
    param :phone, String, 'Phone of the costumer', required: false
    param :cpf, String, 'CPF of the costumer', required: false
    param :email, String, 'Email of the costumer', required: false
  end

  api :GET, '/costumers', 'Get all the costumers'
  def index
    render json: Costumer.all, status: 200
  end

  api :GET, '/costumers/:id', 'Get the current costumer'
  param :id, String, 'id of the costumer to retrieve'
  def show
    costumer = CostumersRepository.find(costumer_params[:id])

    render json: costumer
  end

  def create
    costumer = Costumers::CreateCostumer.new(costumer_params: costumer_params.transform_keys(&:to_sym)).perform
    render json: costumer
  end

  api :PUT, '/costumers', 'Updates the costumer infos'
  param_group :update_costumer_params
  def update
    costumer = Costumers::UpdateCostumer.new(costumer_params: costumer_params.transform_keys(&:to_sym)).perform
    render json: costumer
  end

  api :DELETE, '/costumers', 'Deletes the costumer'
  param :id, String, 'ID of the costumer to be deleted'
  def destroy
    CostumersRepository.destroy(costumer_params[:id])

    head :no_content
  end

  private

  def costumer_params
    params.permit(
      :id, :name, :phone, :cpf, :email, :password,
      address: [:street, :zip_code, :city, :state, :country]
    )
  end
end
