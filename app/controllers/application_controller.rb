class ApplicationController < ActionController::Base

  before_action :redirect_if_not_signed_in, only: %i[index show new edit]

  private

  def current_user
    User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def signed_in?
    if session[:current_user_id] && User.find(session[:current_user_id])
      true
    else
      false
    end
  end

  def redirect_if_not_signed_in
    unless signed_in?
      flash[:error] = 'Unauthorized: Please sign in first'
      redirect_to root_path
    end
  end
end
