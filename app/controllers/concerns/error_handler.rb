module ErrorHandler
  extend ActiveSupport::Concern

  CODES = [11, 22, 33, 44, 55].freeze

  included do
    rescue_from ArgumentError, with: :render_exception
    rescue_from Apipie::ParamInvalid, with: :render_apipie_exception
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_exception
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid_exception
    rescue_from SecurityError, with: :render_security_exception
  end

  private

  def render_exception(exception)
    render json: exception.message, status: 400
  end

  def render_apipie_exception
    render json: 'Missing parameters', status: 400
  end

  def record_not_found_exception(exception)
    render json: { error: exception.message }, status: 404
  end

  def record_invalid_exception(exception)
    render json: { error: exception.message }, status: 422
  end

  def render_security_exception
    render json: 'User not authorized', status: 401
  end
end
