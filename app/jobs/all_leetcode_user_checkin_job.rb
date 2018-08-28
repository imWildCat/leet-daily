class AllLeetcodeUserCheckinJob < ApplicationJob
  queue_as :default

  def perform(*args)
    all_leetcode_users = LeetcodeUser.all

    all_leetcode_users.each do |u|
      CheckLeetcodeUserJob.perform_later(u)
    end
  end
end
