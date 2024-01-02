class ApplicationController < ActionController::API
  include ResponseHelper
  include AuthTokenConcern
  respond_to :json

  def render_200
    render json: json_with_success(message: "OK"), status: :ok
  end

  def render_404
    render json: json_with_error(message: I18n.t('errors.messages.not_found')), status: :not_found
  end

  def authenticate_user!
    authenticate_user_from_token!
    return render json: json_with_error(message: I18n.t('devise.failure.unauthenticated')), status: :unauthorized unless @current_user
  end

  def authenticate_if_token_present
    auth_token && authenticate_user!
  end

  def with_transaction
    ActiveRecord::Base.transaction do
      yield
    end
  end
end
