module Interactors::Kafka
  class Base
    def get_topic_name topic, prefix = nil
      prefix ||= ENV.fetch('APP_NAME', 'review-company').downcase
      "#{prefix.downcase}-#{topic}".dasherize
    end
  end
end