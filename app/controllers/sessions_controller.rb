class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_signed_in

  def new
  end

  def create
    user = User.find_by_username(params[:user][:username])
    if user.authenticate(params[:user][:password])
      session[:current_user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to signin_form_path
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to root_url
  end
end
