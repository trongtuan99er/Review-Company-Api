class SidekiqQueue
  CLOCK_MISSION            = 'clock_mission'.freeze
  FIND_AND_DESTROY_COMAPNY = 'find_and_destroy_company'.freeze
  FIND_AND_DESTROY_REIVEWS = 'find_and_destroy_reivews'.freeze
  HANDLE_LIKE_EVENT        =  'handle_like_event'.freeze
end

class Tenant
  DEFAULT_SCHEMA = 'public'.freeze
  ASIA_SCHEMA    =  'asia'.freeze
  EUROPE_SCHEMA  =  'europe'.freeze
  AMERICA_SCHEMA = 'america'.freeze
end

class LikeEventAction
  CREATE =  'create'.freeze
  UPDATE =  'update'.freeze
end
