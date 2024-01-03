class Workers::HandleLikeEvent
  include Sidekiq::Worker
  sidekiq_options queue: SidekiqQueue::HANDLE_LIKE_EVENT, retry: false

  def initialize
    puts "init Workers::HandleLikeEvent"
  end

  def perform payload
    Apartment::Tenant.switch payload.delete("tenant") do
      action = payload.delete("action")
      like_id = payload.delete("like_id")
      Like.create(payload) if action == LikeEventAction::CREATE
      Like.find_by(id: like_id)&.update!(status: payload["status"]) if action == LikeEventAction::UPDATE
    end
    puts "event handle done!"
  end

end