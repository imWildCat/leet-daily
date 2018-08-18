class Admin::BaseController < ApplicationController

  before_action :check_admin

  private

  def check_admin
    policy = AdminPolicy.new(current_user)
    unless policy.admin?
      flash[:error] = 'Invalid access'
      redirect_to root_path
    end
  end
end
