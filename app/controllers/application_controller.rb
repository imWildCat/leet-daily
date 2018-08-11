class ApplicationController < ActionController::Base
  # New feature:
  # https://evilmartians.com/chronicles/rails-5-2-active-storage-and-beyond
  # http://api.rubyonrails.org/classes/ActiveSupport/CurrentAttributes.html
  before_action :_set_current_user

  protected

  def current_user
    if session[:user_id]
      User.find_by_id(session[:user_id])
    else
      nil
    end
  end

  def set_current_user(user)
    session[:user_id] = user.id
  end

  def del_current_user
    session[:user_id] = nil
  end

  helper_method :current_user

  private

  def _set_current_user
    Current.user = current_user
  end
end
