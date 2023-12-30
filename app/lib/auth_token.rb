require 'jwt'

class AuthToken
  def self.access_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.valid_payload(payload)
    true
  end

  def self.decode_token(token)
    decoded = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError
    nil
  end
end
