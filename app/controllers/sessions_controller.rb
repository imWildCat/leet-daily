class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p = user_params

    user = User.find_by(email: p[:email])

    if user && user.authenticate(p[:password])
      # Log the user in and redirect to the user's show page.
      set_current_user(user)
      flash[:success] = 'Welcome back, ' + user.username + '!'
      redirect_to root_path
    else
      # Create an error message.
      flash[:error] = 'Invalid email or password. Please try again.'
      @user = User.new
      render 'new'
    end

  end

  def destroy
    del_current_user
    flash[:info] = 'You\'ve successfully signed out, bye!'
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
