class Api::V1::RegistrationsController < Devise::RegistrationsController
  include ResponseHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_role_id, only: [:create]

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
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :role_id)
  end

  def set_role_id
    params[:user][:role_id] = Role.find_by(role: 'user', status: :active).id
  end

  def configure_permitted_parameters
    added_attrs = %i[email password password_confirmation first_name last_name phone_number role_id]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
