class ApplicationController < ActionController::API
  include ResponseHelper

  def render_200
    render json: json_with_success(message: "OK"), status: :ok
  end

  def render_404
    render json: json_with_error(message: "no route found"), status: :not_found
  end


end
