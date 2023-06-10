module ErrorHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ArgumentError, with: :render_exception
    rescue_from Apipie::ParamInvalid, with: :render_apipie_exception
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_exception
  end

  private

  def render_exception(exception)
    render json: exception.message, status: 400
  end

  def render_apipie_exception
    render json: 'Missing parameters', status: 400
  end

  def record_not_found_exception
    render json: 'Could not locale in database', status: 500
  end
end
