class Api::V1::UserController < ApplicationController
  around_action :with_transaction, except: %i[update_profile delete_user]
  before_action :get_user, only: [:update_profile, :delete_user, :index]
  before_action :validate_permission, only: [:update_profile, :delete_user]

  def index
    render json: json_with_success(data: @user, default_serializer: UserSerializer)
  end

  def update_profile
    @user.update!(update_profile_params)
    render json: json_with_success(data: @user, default_serializer: UserSerializer)
  end

  def delete_user
    @user.update_attribute(:is_deleted, true)
    render json: json_with_empty_success
  end

  private

  def update_profile_params
    params.permit(:gender, :first_name, :last_name, :email)
  end

  def validate_permission
    return render json: json_with_error(message: "can't do action for this user") \
      unless @user.id == User.current_user.id
  end

  def get_user
    @user = User.find(params[:id])
  end

end
