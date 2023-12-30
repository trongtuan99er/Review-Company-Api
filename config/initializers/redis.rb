require 'redis'
class RedisInitializer
  class << self
    def get_redis(url)
      Redis.new(url: url, timeout: 10)
    end
  end
end
REDIS_URL     = ENV['REDIS_URL'] || 'redis://localhost:6379'
Redis.current = RedisInitializer.get_redis(REDIS_URL)