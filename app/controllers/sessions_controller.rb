class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.find_by_credentials(user_params[:email], user_params[:password])
    if user
      log_in_user!(user)
      #debugger
      redirect_to goals_url
    else
      flash[:errors] = ["The email/password combination is invalid."]
      redirect_to new_sessions_url
    end
  end

  def destroy
    log_out_user!
    redirect_to goals_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
