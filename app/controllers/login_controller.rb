class LoginController < ApplicationController
  before_action :costumer_have_account?, only: [:validate]
  after_action :add_headers, only: [:login]

  def login
    @costumer = CostumersRepository.get_costumer(login_params[:email])

    if @costumer&.authenticate(login_params[:password])
      regenerate_tokens
      render json: @costumer
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def validate
    if @current_costumer.nil?
      head :no_content
    else
      render json: @current_costumer
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
