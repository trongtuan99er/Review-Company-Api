# frozen_string_literal: true
require 'kafka'

KAFKA_URL     = ENV.fetch('KAFKA_URL', 'localhost:29092').split(',').freeze

KAFKA         = Kafka.new(KAFKA_URL, client_id: ENV.fetch('APP_NAME', 'review-company').downcase).freeze
PRODUCER_POOL = ConnectionPool.new(size: ENV.fetch('PRODUCER_POOL_SIZE', 10).to_i, timeout: ENV.fetch('PRODUCER_POOL_TIMEOUT', 5).to_i) {
  KAFKA.producer(idempotent: true)
}

class KafkaTopics
  LIKE_EVENT        = 'like_event'.freeze
end

class KafkaGroups
  LIKE_EVENT        = 'like_event'.freeze
end