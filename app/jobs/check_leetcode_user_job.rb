require 'net/http'
require 'nokogiri'

class CheckLeetcodeUserJob < ApplicationJob
  queue_as :default

  def perform(leetcode_user)
    url = URI.parse("https://leetcode.com/#{leetcode_user.leetcode_id}/")

    resp = Net::HTTP.get(url)

    if resp
      html_doc = Nokogiri::HTML(resp)

      # real_name = html_doc.css('.realname').text.strip

      progress_str = html_doc.xpath('//*[@id="base_content"]/div/div/div[1]/div[3]/ul/li[1]/span').text.strip

      # recent_activity_str = html_doc.css('#base_content div.col-sm-7.col-md-8  div > ul > a:nth-child(1) > span.text-muted').text.strip

      current_progress = progress_str[/\d+/].to_i

      checkin = LeetcodeUserCheckin.find_or_initialize_by(leetcode_user: leetcode_user, on_date: Date.today)

      last_checkin = LeetcodeUserCheckin.order(id: :desc).where('on_date < ?', Date.today).find_by(leetcode_user: leetcode_user)

      last_finished_count = 0

      if last_checkin
        last_finished_count = last_checkin.finished_count
      end

      checkin.finished_count = current_progress
      checkin.delta = current_progress - last_finished_count

      checkin.save
    end
  end
end
