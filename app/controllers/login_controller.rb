class LoginController < ApplicationController
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
end
