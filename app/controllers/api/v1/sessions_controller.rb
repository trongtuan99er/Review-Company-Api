class Api::V1::SessionsController < Devise::SessionsController
  include ResponseHelper

  def create
    resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: json_with_success(data: resource.as_json.merge!(access_token: AuthToken.access_token({ user_id: resource.id })))
  end
end
