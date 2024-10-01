class Admin::PostCommentsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @comments = PostComment.all
  end

  def destroy
    @comment = PostComment.find(paramas[:id])
    @comment.destroy
    redirect_to admin_post_comments_path, notice: '投稿を削除しました。'
  end
end
