# frozen_string_literal: true
module Interactors::Kafka
  class Consumers::LikeEvent < Consumer
    def initialize group_id
      super group_id
      topics = Array(KafkaTopics::LIKE_EVENT)
      topics.each { |topic| subscribe_topic(nil, topic) }
    end

    def handle_event(event)
      like_payload = OpenStruct.new(JSON.parse(event.value))
      log(event.topic,
          event.offset,
          event.partition)
      return unless like_payload

      Workers::HandleLikeEvent.perform_async(like_payload.to_h)
    end
  end
end