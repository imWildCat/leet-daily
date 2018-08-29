class UserNotifierMailer < ApplicationMailer

  def send_daily_report(user)
    @user = user
    mail(to: @user.email, subject: "LeetDaily report on #{Date.today}")
  end

  def set_or_reset_password(user, token, is_reset = true)
    @user = user
    @is_reset = is_reset
    @draft_title = is_reset ? 'reset' : 'creation'
    @token = token

    mail(to: @user.email, subject: "User password #{@draft_title} - LeetDaily")
  end


end
