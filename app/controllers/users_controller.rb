class UsersController < ApplicationController
  skip_before_action :redirect_if_not_signed_in, only: %i[new]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params(:username, :password))
    if user.save
      redirect_to user_path(user)
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.authenticate(params[:user][:password])
      if params[:user][:username] && params[:user][:new_password]
        user.update(user_params(:username, :new_password))
        redirect_to user_path(user)
      elsif params[:user][:username]
        user.update(user_params(:username))
        redirect_to user_path(user)
      elsif params[:user][:new_password]
        user.update(user_params(:new_password))
        redirect_to user_path(user)
      else
        redirect_to edit_user_path(user)
      end
    else
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to users_path
    else
      redirect_to user_path(user)
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
