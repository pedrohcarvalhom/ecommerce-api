class LoginController < ApplicationController
  after_action :add_headers

  api :POST, '/login', 'Login your costumer account'
  param :email, String, 'Email registered', required: true
  param :password, String, 'Password registered', required: true
  def login
    @costumer = CostumersRepository.get_costumer(login_params[:email])

    if @costumer&.authenticate(login_params[:password])
      regenerate_tokens
      render json: @costumer
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def regenerate_tokens
    @costumer.regenerate_token
    @costumer.regenerate_recover_password_token
  end

  def add_headers
    headers['Access-Control-Allow-Headers'] = '*'
    response.headers['Authorization'] = @costumer.token
  end
end
