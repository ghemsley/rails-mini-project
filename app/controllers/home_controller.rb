class HomeController < ApplicationController
  skip_before_action :redirect_if_not_signed_in
  def index
    @user = current_user
  end
end
