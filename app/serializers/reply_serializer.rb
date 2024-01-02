class ReplySerializer < BaseSerializer
  attributes :id, :content, :user_id, :is_deleted, :is_edited, :created_at, :updated_at, :created_at_timestamp, :updated_at_timestamp
  belongs_to :review, serializer: ReviewSerializer
end
