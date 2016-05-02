class WelcomeController < ApplicationController
  def home
    if logged_in?
      @post = current_user.posts.build
      @posts = current_user.posts.paginate(page: params[:page], per_page: 20).order(created_at: :desc)
    end
  end
  
  def about
  end
end
