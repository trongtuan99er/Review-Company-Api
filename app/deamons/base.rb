class Base
  def initialize(consumer)
    @consumer = consumer
  end

  def daemon
    trap("TERM") { @consumer.stop_consumer }
    @consumer.each_event do |event|
      @consumer.handle_event(event)
    rescue Exception => e
      raise e
    end
  end
end
