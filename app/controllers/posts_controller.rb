class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.all
    render :json => @posts
  end

  def show
    @post = Post.find(params[:id])
    render :json => @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_with @post
    else
      respond_with @post.errors
    end
  end

  def edit
    @post = Post.find(post_params)
    render('posts/edit.html.erb')
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      respond_with @post
    else
      respond_with @post.errors
    end
  end


  def destroy
    @post = Post.find(params[:id])
    respond_with @post.destroy

  end

private

  def post_params
    params.require(:post).permit(:title, :body, :comment)
  end

end
