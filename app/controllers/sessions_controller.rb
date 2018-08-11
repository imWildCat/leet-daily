class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    p = user_params

    user = User.find_by(email: p[:email])

    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      flash[:success] = 'Welcome back, ' + user.username + '!'
    else
      # Create an error message.
      flash[:error] = 'Invalid email or password. Please try again.'
      @user = User.new
      render 'new'
    end

  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
