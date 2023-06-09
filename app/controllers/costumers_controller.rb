class CostumersController < ApplicationController
  def_param_group :create_costumer_params do
    param :name, String, desc: 'Name of the costumer', required: true
    param :address, String, desc: 'Address of the costumer', required: true
    param :phone, String, desc: 'Phone of the costumer', required: true
    param :cpf, String, desc: 'CPF of the costumer', required: true
    param :email, String, desc: 'Email of the costumer', required: true
    param :password, String, desc: 'Password of the costumer', required: true
  end

  def_param_group :update_costumer_params do
    param :id, String, desc: 'ID of the created costumer', required: true
    param :name, String, desc: 'Name of the costumer', required: false
    param :address, String, desc: 'Address of the costumer', required: false
    param :phone, String, desc: 'Phone of the costumer', required: false
    param :cpf, String, desc: 'CPF of the costumer', required: false
    param :email, String, desc: 'Email of the costumer', required: false
  end

  api :GET, '/costumers', 'Get all the costumers'
  def index
    render json: Costumer.all, status: 200
  end

  def show
  end

  api :POST, '/costumers', 'Create a costumer'
  param_group :create_costumer_params
  def create
    costumer = Costumers::CreateCostumer.new(costumer_params: costumer_params.to_h).perform
    render json: costumer
  rescue => e
    render json: e.exception, status: 500
  end

  api :PUT, '/costumers', 'Updates the costumer infos'
  param_group :update_costumer_params
  def update
  end

  api :DELETE, '/costumers', 'Deletes the costumer'
  param :id, String, desc: 'ID of the costumer to be deleted'
  def destroy
  end

  private

  def costumer_params
    params.permit(:name, :address, :phone, :cpf, :email, :password)
  end
end
