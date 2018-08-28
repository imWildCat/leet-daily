class Account::ForgetPasswordsController < ApplicationController
  def edit
    token = params[:token]

    user_id = Rails.cache.read(User.pass_reset_token_key(token))

    if user_id
      @user = User.find(user_id)
      session[:user_id] = user_id
      session[:token] = token
    else
      flash[:error] = 'Invalid token.'
      redirect_to root_path
    end
  end

  # noinspection RailsChecklist01
  def update
    user_id = session[:user_id]

    @user = User.find(user_id)

    if @user.update(user_password_params)
      Rails.cache.delete(User.pass_reset_token_key(session[:token]))
      redirect_to root_path, notice: 'You\'ve updated your password successfully.'
    else
      render 'edit'
    end
  end

  private

  def user_password_params
    params.require(:user).permit(:password)
  end
end
