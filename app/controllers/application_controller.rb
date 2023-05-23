class ApplicationController < ActionController::Base
  def current_user
    session[:current_user]
  end

  def authenticate!
    redirect_to new_session_path  unless current_user.present?
  end
  
end
