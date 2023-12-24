class Review < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }

  belongs_to :user, optional: true
  belongs_to :company
  before_create :set_default_values
  after_commit :update_company_total_review, on: :create

  private

  def update_company_total_review
    Company.transaction do
      company.increment!(:total_reviews, 1)
    end
  end

  def set_default_values
    self.is_anonymous = true if self.is_anonymous.nil?
    self.vote_for_quit = false if self.vote_for_quit.nil?
    self.vote_for_work = false if self.vote_for_work.nil?
  end
end
