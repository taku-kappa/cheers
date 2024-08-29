class PostsController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_matching_login_user_post, only: [:edit, :update, :destroy]

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new
  end

  def index
  end

  def search
    if params[:keyword] != ""
      @posts = Post.where('shop_name LIKE(?) OR menu1_name LIKE(?) OR menu1_price LIKE(?) OR menu1_description LIKE(?) OR
      menu2_name LIKE(?) OR menu2_price LIKE(?) OR menu2_description LIKE(?) OR menu3_name LIKE(?) OR menu3_price LIKE(?) OR menu3_description LIKE(?)',
      "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%")

      @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
      if @posts.blank? && @users.blank?
        redirect_to posts_path
      end
    end
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
    params.require(:post).permit(:shop_name, :menu1_name, :menu1_price, :menu1_description, :menu2_name, :menu2_price, :menu2_description,
    :menu3_name, :menu3_price, :menu3_description)
  end

  def is_matching_login_user_post
    @post = current_user.posts.find_by(id: params[:id])
    unless @post
      redirect_to posts_path
    end
  end
end
