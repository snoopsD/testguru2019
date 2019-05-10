class SessionsController < ApplicationController

  before_action :set_user, only: :create

  def new
  end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Login successfully"
      redirect_to cookies[:back_path] || root_path
    else
      flash[:alert] = "Verify your Email and Password"
      render :new
    end   
  end

  def destroy
    session.delete(:user_id)
    flash[:alert] = "Logout successfully"
    redirect_to root_path
  end

  private 

  def set_user
    @user = User.find_by(email: params[:email].downcase)
  end

end
