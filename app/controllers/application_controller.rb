class ApplicationController < ActionController::API
  attr_reader :current_costumer

  include ErrorHandler

  def authenticate_costumer
    set_current_costumer
  end

  def costumer_have_account?
    token = extract_token

    @current_costumer = find_costumer_by_token(token)
  end

  private

  def set_current_costumer
    token = extract_token

    raise SecurityError unless token.present?

    @current_costumer = find_costumer_by_token(token)

    raise SecurityError unless @current_costumer
  end

  def extract_token
    token = request.headers['Authorization']&.split(' ')

    token[1]
  end

  def find_costumer_by_token(token)
    Costumer.find_by(token: token)
  end
end
