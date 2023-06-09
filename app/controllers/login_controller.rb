class LoginController < ApplicationController
  def login
    @costumer = CostumersRepository.get_costumer(params[:email])

    if @costumer&.authenticate(params[:password])
      render json: @costumer
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
