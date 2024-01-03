class Workers::HandleLikeEvent
  include Sidekiq::Worker
  sidekiq_options queue: SidekiqQueue::HANDLE_LIKE_EVENT, retry: false

  def initialize
    puts "init Workers::HandleLikeEvent"
  end

  def perform payload
    Apartment::Tenant.switch payload.tenant do
      action = payload.action
      Like.create(user_id: payload.user_id, review_id: payload.review_id, status: payload.status) if action == LikeEventAction::CREATE
      Like.find_by(id: payload.like_id)&.update!(status: payload.status) if action == LikeEventAction::UPDATE
    end
    puts "event handle done!"
  end

end