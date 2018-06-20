class PostsController < ApplicationController
  def index
  	#@user = User.all
 	#@post = @users.collect { |user| user.posts }.flatten
 	@post = Post.includes(:user)
 	@post.user = current_user
  end

  def new
  	@post = Post.new
  end
  def create 
  	@post = Post.new(postParams)
  if @post.save
    flash[:success] = "Post successfully added"
    redirect_to posts_path(@post)
  else
    render 'new'
  end
  end
  def show
  	@post = Post.find(params[:id])
  end

  def update
  end

  def delete
  end
  def postParams
    params.require(:post).permit(:body)
  end
end
