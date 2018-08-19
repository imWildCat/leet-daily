class Admin::LeetcodeUsersController < Admin::BaseController

  def index
    @users = LeetcodeUser.all
  end

  def new
    @leetcode_user = LeetcodeUser.new
  end

  def create
    @leetcode_user = LeetcodeUser.new l_user_params

    if @leetcode_user.save
      flash[:success] = 'User reference created.'
      redirect_to admin_leetcode_users_path
    else
      render :new
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def l_user_params
    params.require(:leetcode_user).permit(:leetcode_id)
  end

end
