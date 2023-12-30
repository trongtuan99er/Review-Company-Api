module AuthTokenConcern
  extend ActiveSupport::Concern

  def authenticate_user_from_token!
    return unless auth_token

    if (payload = AuthToken.decode_token(auth_token)) && AuthToken.valid_payload(payload)
      user_id = payload['user_id']
      @current_user ||= User.find_by(id: user_id)
    end
    return render json: { error: 'Invalid token' }, status: :unauthorized unless @current_user
  end

  def auth_token
    @auth_token ||= request.headers['Authorization']&.split(' ')&.last
  end

  def current_user
    @current_user ||= User.current_user
  end

end
