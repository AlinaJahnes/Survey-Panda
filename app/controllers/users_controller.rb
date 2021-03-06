class UsersController < ApplicationController

  def new
    @user = User.new
    if request.xhr? 
      render partial: 'new', layout: false
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "You have successfully signed up! Please log in."
      redirect_to root_path
    else
      flash[:error] = "Password must be between 6 and 15 characters long."
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @username = @user.username
    @surveys = @user.surveys
    @taken_surveys = @user.taken_surveys
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
