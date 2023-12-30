require 'clockwork'
require './config/environment'

module Clockwork

  handler do |job, time|
    puts "Running #{job} at #{time}"
  end

  default_time                           = ENV.fetch('DEFAULT_CRONJOB_EXECUTE_TIME', '01:00')
  cronjob_time_to_destroy_company        = ENV.fetch('CRONJOB_TIME_TO_DESTROY_COMPANY', 1)
  cronjob_time_to_destroy_reivews        = ENV.fetch('CRONJOB_TIME_TO_DESTROY_REIVEWS', 60)

  clock_mission = -> (mission, action, *args) { Workers::ClockMission.perform_async(mission, action, *args) }

  if ENV['ENABLE_FIND_AND_DESTROY_COMPANY'].to_i.positive?
    log_msg = 'running find and destroy company job'
    test_time = ENV.fetch('TEST_FIND_AND_DESTROY_COMPANY_TIME', 1)

    unless test_time.to_i.zero?
      every cronjob_time_to_destroy_company.to_i.day, log_msg do
        clock_mission.call(Workers::FindAndDestroyCompany, "execute")
      end
    else
      every test_time.to_i.minutes, log_msg do
        clock_mission.call(Workers::FindAndDestroyCompany, "execute")
      end
    end
  end

  if ENV['ENABLE_FIND_AND_DESTROY_REVIEW'].to_i.positive?
    log_msg = 'running find and destroy reviews job'
    test_time = ENV.fetch('TEST_FIND_AND_DESTROY_REVIEWS_TIME', 1)

    unless test_time.to_i.zero?
      every cronjob_time_to_destroy_reivews.to_i.minutes, log_msg do
        clock_mission.call(Workers::FindAndDestroyReviews, "execute")
      end
    else
      every test_time.to_i.minutes, log_msg do
        clock_mission.call(Workers::FindAndDestroyReviews, "execute")
      end
    end
  end

end