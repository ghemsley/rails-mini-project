module ApplicationHelper
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
end
