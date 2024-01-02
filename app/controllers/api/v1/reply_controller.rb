class ReplyController < ApplicationController
  before_action :authenticate_user!
  before_action :get_review, only: %i[create index]
  before_action :get_reply, only: %i[update destroy]

  def index
    @replies = Reply.where(review_id: @review)
    render json: json_with_success(message: "ok", data: @replies)
  end

  def create
    reply = Reply.create!(reply_review_params.merge!(user_id: current_user.id, review_id: @review.id))
    render json: json_with_success(message: "ok", data: reply)
  end

  def update
    @reply.update!(reply_review_params)
    render json_with_success(message: "ok", data: @reply)
  end

  def destroy
    @reply.destroy
    render json: json_with_success(message: "ok")
  end

  private
  def get_reply
    @reply = Reply.find(params[:reply_id])
  end

  def get_review
    @review = Review.find(params[:review_id])
  end

  def reply_review_params
    params.permit(:content)
  end
end
