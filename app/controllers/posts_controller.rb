class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_matching_login_user_post, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "success"
    redirect_to user_path(@post.user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def is_matching_login_user_post
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_path
    end
  end
end
