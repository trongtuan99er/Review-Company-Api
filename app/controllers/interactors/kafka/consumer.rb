# frozen_string_literal: true
class Interactors::Kafka::Consumer < Interactors::Kafka::Base

  def initialize(group_id)
    group_name = get_topic_name group_id, "#{ENV.fetch('APP_NAME', 'review-company').downcase}"
    @consumer  = KAFKA.consumer(group_id: group_name.dasherize)
  end

  def each_event
    @consumer.each_message(max_wait_time: 0.5) do |message|
      yield message if message
    end
  end

  def stop_consumer
    @consumer.stop
  end

  def subscribe_topic(prefix, topic)
    topic = get_topic_name topic, prefix
    puts "Subscribing topic: #{topic}"
    @consumer.subscribe(topic)
  end

  def log(topic=nil, offset=nil, partition=nil)
    puts "Topic:     #{topic}" if topic
    puts "Offset:    #{offset}" if offset
    puts "Partition: #{partition}" if partition
  end

end
