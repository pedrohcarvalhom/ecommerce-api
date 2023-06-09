class ApplicationController < ActionController::API
  attr_reader :current_costumer

  def authenticate_costumer
    set_current_costumer
  rescue SecurityError => e
    render json: e.exception, status: 401
  end

  private

  def set_current_costumer
    token = extract_token
    @current_costumer = Costumer.find_by(token: token)

    raise SecurityError, 'Unauthorized' unless @current_costumer
  end

  def extract_token
    token = request.headers['Authorization']&.split(' ')

    raise SecurityError, 'Unauthorized' if token[1].nil?

    token[1]
  end
end
