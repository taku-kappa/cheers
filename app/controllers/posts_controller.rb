class PostsController < ApplicationController
  before_action :is_matching_login_user_post, only: [:edit, :update]
  def new
    @post = Post.new
  end

  def show
  end

  def index
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.user_id == current_user.id
      if @post.save
        redirect_to post_path(@post.id)
      else
        render :new
      end
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end


  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def is_matching_login_user_post
    post =Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to posts_path
    end
  end

end
