class ReviewSerializer < BaseSerializer
  attributes :id, :title, :reviews_content, :score, :vote_for_quit, :vote_for_work,
             :is_anonymous, :user_id, :created_at, :updated_at, :company_id, :created_at_timestamp,
             :updated_at_timestamp
  belongs_to :company, serializer: CompanySerializer
end
