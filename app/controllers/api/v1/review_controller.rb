class Api::V1::ReviewController < ApplicationController

  before_action :get_company, only: [:create, :index]
  before_action :get_review, only: [:update, :delete_review]
  before_action :validate_update, only: :update

  def index
    data = @company.reviews.all
    render json: json_with_success(data: data, default_serializer: ReviewSerializer)
  end

  def create
    create_payload = create_params.merge!(company_id: @company.id)
    data = Review.create!(create_payload)
    render json: json_with_success(data: data, default_serializer: ReviewSerializer)
  end

  def update
    @review.update!(update_params)
    render json: json_with_success(data: @review, default_serializer: ReviewSerializer)
  end

  def delete_review
    @review.update_attribute(:is_deleted, true)
    render json: json_with_empty_success
  end


  private

  def validate_update
    return render json: json_with_error(message: "cant update deleted reivew") if @review.is_deleted
  end

  def get_review
    @review = Review.find(params[:id])
    return render json: json_with_error(message: "review not found") unless @review
  end

  def get_company
    @company = Company.find(params[:company_id])
    return render json: json_with_error(message: "company not found") unless @company
  end

  def create_params
    params.require(:review).permit(:title, :review_content, :score)
  end

  def update_params
    params.require(:review).permit(:review_content, :score)
  end
end
