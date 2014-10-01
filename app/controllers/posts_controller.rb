class PostsController < ApplicationController
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
      respond_to do |format|
        format.html do
          flash[:notice] = "Post created."
          redirect_to root_path
        end
        format.json { render :json => @post, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @post.errors, :status => 422 }
      end
    end
  end

  def edit
    @post = Post.find(post_params)
    render('posts/edit.html.erb')
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      respond_to do |format|
        format.html do
          flash[:notice] = "Post updated."
          redirect_to root_path
        end
        format.json { render :json => @post, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @post.errors, :status => 422 }
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Post deleted."
        redirect_to root_path
      end
      format.json { head :no_content }
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :body, :comment)
  end

end
