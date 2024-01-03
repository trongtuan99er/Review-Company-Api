class Like < ApplicationRecord

  enum status: {
    default: 0,
    like: 1,
    dislike: 2
  }
  validates :status, :user_id, :review_id, presence: true
  validates :user_id, uniqueness: { scope: :review_id }, on: :create

  belongs_to :user
  belongs_to :review

  scope :get_like_review_by_user_id, -> (review_id, user_id) {
    where(user_id: user_id, review_id: review_id)
  }

  after_commit :update_total_like_dislike, on: %i[create update]

  private

  def update_total_like_dislike
    return unless saved_change_to_status?
    review.with_lock do
      case status.to_sym
      when :like
        review.increment!(:total_like, 1)
        review.decrement!(:total_dislike, 1) if previous_changes[:status][0].to_sym == :dislike
      when :dislike
        review.increment!(:total_dislike, 1)
        review.decrement!(:total_like, 1) if previous_changes[:status][0].to_sym == :like
      end
    end
  end
end
