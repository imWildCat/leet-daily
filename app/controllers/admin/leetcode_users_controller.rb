class Admin::LeetcodeUsersController < Admin::BaseController

  before_action :set_leetcode_user, only: [:edit, :update]

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
    if @leetcode_user.update(leetcode_user_params)
      redirect_to admin_leetcode_users_path, notice: 'Update successfully.'
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def l_user_params
    params.require(:leetcode_user).permit(:leetcode_id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_leetcode_user
    @leetcode_user = LeetcodeUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def leetcode_user_params
    params.require(:leetcode_user).permit(:leetcode_id)
  end

end
