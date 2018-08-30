class DailyReportJob < ApplicationJob
  queue_as :default

  MIN_PROGRESS = 2
  WEEKLY_REST_ALLOWED = 2

  def perform(*args)
    checkins = LeetcodeUserCheckin.eager_load(:leetcode_user).where(on_date: Date.yesterday).order(id: :asc).all.to_a

    unfinished = checkins.select do |c|
      c.delta < MIN_PROGRESS
    end

    ignore_further_check = (Date.today.wday == 1 or Date.today.wday == 2)

    having_rest = []
    notable = []

    if ignore_further_check
      having_rest = unfinished
    else
      monday = prior_monday(Date.today)
      unfinished.each do |c|
        # This needs to be optimised: (n + 1 query)
        rest_count = LeetcodeUserCheckin.where('on_date >= ?', monday).where(leetcode_user: c.leetcode_user).where('delta < ?', MIN_PROGRESS).count
        if rest_count > WEEKLY_REST_ALLOWED
          notable.push(c)
        else
          having_rest.push(c)
        end
      end
    end


    finished = checkins.select do |c|
      c.delta >= 2
    end


    emails_str = SiteConfig.find_by_key('report_to_emails')&.value || ''
    emails = emails_str.split(',')
    emails = emails.map {|e| e.strip}

    data = {
        finished: finished,
        having_rest: having_rest,
        notable: notable
    }

    emails.each do |e|
      ReportMailer.daily_report(e, data).deliver
    end
  end

  private

  def prior_monday(date)
    days_before = (date.wday + 5) % 7 + 1
    date.to_date - days_before
  end

end
