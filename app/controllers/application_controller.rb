class ApplicationController < ActionController::API
  attr_reader :current_costumer

  def authenticate_costumer
    token = extract_token

    raise SecurityError, 'Unauthorized' if token.nil?

    @current_costumer = Costumer.find_by(token: extract_token)
  end

  private

  def extract_token
    token = request.headers['Authorization']&.split(' ')

    return nil unless token

    token[1]
  end
end
