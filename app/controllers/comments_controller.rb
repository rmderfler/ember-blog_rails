class CommentsController < ApplicationController
  def index
    @comments = Comment.all
     respond_to do |format|
        format.json { render :json => @comments }
      end
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment created."
          redirect_to root_path
        end
        format.json { render :json => @comment, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @comment.errors, :status => 422 }
      end
    end
  end

  def edit

  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:text])
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment updated."
          redirect_to root_path
        end
        format.json { render :json => @comment, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @comment.errors, :status => 422 }
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Comment deleted."
        redirect_to root_path
      end
      format.json { head :no_content }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end

end
