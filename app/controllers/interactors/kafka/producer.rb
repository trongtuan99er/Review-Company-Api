class Interactors::Kafka::Producer < Interactors::Kafka::Base

  def produce(message, topic, partition_key, key = nil, add_topic_prefix = true, prefix: nil)
    topic = get_topic_name(topic, prefix) if add_topic_prefix
    key ||= message[:type]
    message = JSON.dump message
    PRODUCER_POOL.with do |producer|
      producer.produce(message, key: key, topic: topic, partition_key: partition_key)
      producer.deliver_messages
    end
  end

end