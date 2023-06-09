class LoginController < ApplicationController
  include TokenGenerator

  def login
    @costumer = CostumersRepository.get_costumer(login_params[:email])

    if @costumer&.authenticate(login_params[:password])
      render json: @costumer
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
