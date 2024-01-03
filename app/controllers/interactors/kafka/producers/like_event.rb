# frozen_string_literal: true
module Interactors::Kafka
  class Producers::LikeEvent < Producers::Base

    class << self
      def create data
        producer = Interactors::Kafka::Producer.new
        producer.produce data, KafkaTopics::LIKE_EVENT, data[:tenant]
      end
    end

  end
end
