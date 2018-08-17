class AdminPolicy < ApplicationPolicy

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def admin?
    @user.user_group_id == 999
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
