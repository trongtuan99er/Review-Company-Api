class Review < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }

  belongs_to :user, optional: true
  belongs_to :company

  after_commit :update_company_total_review, on: :create

  private

  def update_company_total_review
    Company.transaction do
      company.increment!(:total_reviews, 1)
    end
  end
end
