class ReportMailer < ApplicationMailer

  def daily_report(email, data)
    @data = data
    mail(to: email, subject: "Daily report for #{Date.yesterday.to_s} - LeetDaily")
  end

end
