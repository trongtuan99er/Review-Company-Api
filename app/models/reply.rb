class Reply < ApplicationRecord
  include BaseConcern

  validates :review_id, :user_id, :content, presence: true
  belongs_to :review
  belongs_to :user

  after_commit :update_total_reply_count, on: [:create, :destroy]
  after_commit :update_is_edited, on: :update, if: -> { saved_change_to_content?}

  private

  def update_total_reply_count
    if previous_changes.keys.include?("id") && previous_changes[:id].first.nil?
      review.increment!(:total_reply, 1)
    else
      review.decrement!(:total_reply, 1)
    end
  end

  def update_is_edited
    self.update_attribute(:is_edited, true)
  end

end
