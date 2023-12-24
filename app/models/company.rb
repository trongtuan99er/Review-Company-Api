class Company < ApplicationRecord

  enum company_type: {
    unknown:  0,
    personal: 1,
    government: 2
  }

  validates :name, :owner, presence: true
  has_many :reviews, dependent: :destroy

  after_commit :update_country_score, on: :update, if: -> { saved_change_to_total_reviews? }

  private

  def update_country_score
    return if total_reviews.zero?

    new_avg_score = reviews.sum(:score) / total_reviews
    update_attribute(:avg_score, new_avg_score)
  end
end
