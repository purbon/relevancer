class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def verify_login
    if !user_signed_in?
      flash[:alert] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end

  def verify_admin
    if !current_user.admin?
      flash[:alert] = "You must be admin in to access this section"
      redirect_to root_url
    end
  end
end

