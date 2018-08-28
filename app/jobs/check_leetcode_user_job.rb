require 'net/http'
require 'nokogiri'

class CheckLeetcodeUserJob < ApplicationJob
  queue_as :default

  def perform(leetcode_user)
    url = URI.parse("https://leetcode.com/#{leetcode_user.leetcode_id}/")

    resp = Net::HTTP.get(url)

    if resp
      html_doc = Nokogiri::HTML(resp)

      real_name = html_doc.css('.realname').text.strip

      puts real_name
    end
  end
end
