class Api::V1::RegistrationsController < Devise::RegistrationsController
  include ResponseHelper

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_up(resource_name, resource)
      render json: json_with_success(data: resource, default_serializer: UserSerializer), status: :created
    else
      render json: json_with_error(errors: resource.errors)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
