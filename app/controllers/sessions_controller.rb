class SessionsController < ApplicationController
  def new 
    redirect_to root_path if current_user.present?
  end

  def create 
    user = User.create(user_params)
    session[:current_user] = user
    redirect_to root_path
  end

  def sign_out 
    session[:current_user] = nil
    redirect_to root_path
  end

  private 

  def user_params
    params.permit(:email, :password, :confirm_password)
  end 
end