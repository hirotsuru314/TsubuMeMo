class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create]
  before_action :set_post, only: [:edit, :update, :destroy]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to root_path
    else
      render 'welcome/home'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      flash[:success] = "投稿を編集しました。"
      redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def destroy
    if @post.destroy
      flash[:success] = "投稿を削除しました。"
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
