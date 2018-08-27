class UserNotifierMailer < ApplicationMailer

  default :from => 'leet.daily@leetdaily.aitk.ai'

  def send_daily_report(user)
    @user = user
    mail(to: @user.email, subject: "LeetDaily report on #{Date.today}")
  end

end
