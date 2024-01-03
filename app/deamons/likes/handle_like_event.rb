# bundle exec rails r Likes::HandleLikeEvent.new.daemon => consume topic LIKE_EVENT from this group
class Likes::HandleLikeEvent < Base
  def initialize
    consumer = Interactors::Kafka::Consumers::LikeEvent.new(KafkaGroups::LIKE_EVENT)
    super(consumer)
  end
end