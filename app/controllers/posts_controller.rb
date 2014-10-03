class PostsController < ApplicationController
<<<<<<< HEAD
  respond_to :json

=======
>>>>>>> 418bd384d830a2df6a5a2443d440aa49a38f86d5
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
<<<<<<< HEAD
      respond_with @post
    else
      respond_with @post.errors
=======
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
>>>>>>> 418bd384d830a2df6a5a2443d440aa49a38f86d5
    end
  end

  def edit
    @post = Post.find(post_params)
    render('posts/edit.html.erb')
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
<<<<<<< HEAD
      respond_with @post
    else
      respond_with @post.errors
=======
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
>>>>>>> 418bd384d830a2df6a5a2443d440aa49a38f86d5
    end
  end


  def destroy
    @post = Post.find(params[:id])
<<<<<<< HEAD
    respond_with @post.destroy

=======
    @post.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Post deleted."
        redirect_to root_path
      end
      format.json { head :no_content }
    end
>>>>>>> 418bd384d830a2df6a5a2443d440aa49a38f86d5
  end

private

  def post_params
    params.require(:post).permit(:title, :body, :comment)
  end

end
