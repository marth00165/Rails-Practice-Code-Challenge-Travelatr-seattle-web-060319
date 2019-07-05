class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def destroy
    @post.destroy
    redirect_to @post
  end


  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:content,:likes,:blogger_id,:destination_id)
  end
end
