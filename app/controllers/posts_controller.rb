# Posts Controller
# Author: Dae
class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if params.key?(:post) && @post.update(params[:post].permit(
                   :title, :text, :pic_upload, :remove_pic_upload))
      redirect_to @post
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to blogposts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :pic_upload)
  end
end
