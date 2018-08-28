class LeetcodeUser < ApplicationRecord
  belongs_to :user, optional: true
  has_many :leetcode_user_checkins

  validates :leetcode_id, uniqueness: true, presence: true

  def current_finished_count
    latest_check_in&.finished_count || 0
  end

  def latest_check_in
    checkin = Rails.cache.fetch(ck_latest_checkin, expires_in: 10.minutes) do
      checkin = LeetcodeUserCheckin.order(id: :desc).find_by(leetcode_user: self)
      if checkin
        checkin
      else
        LeetcodeUserCheckin.new
      end
    end

    if checkin.id
      checkin
    else
      nil
    end
  end

  private

  def ck_latest_checkin
    "user_#{self.id}_latest_checkin"
  end

end
