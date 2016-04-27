class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.username}"
      redirect_to root_path
    else
      flash[:danger] = 'ユーザ名またはパスワードが違います。'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
