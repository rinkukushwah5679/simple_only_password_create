class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    return redirect_to login_path, notice: "Invalid email" unless user.present?
    if user.authenticate_over(params[:password])
      session[:user_id] = user.id
      redirect_to user.receptionist? ? new_post_path : posts_path
    else
      return redirect_to login_path, notice: "Invalid password"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Please login again"
  end
end
