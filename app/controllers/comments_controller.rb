class CommentsController < ApplicationController
  respond_to :json

  def index
    @comments = Comment.all
    render :json => @comments
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      respond_with @comment
    else
      respond_with @comment.errors
    end
  end

  # def update
  #   @comment = Comment.find(params[:id])
  #   if @comment.update(params[:text])
  #     respond_with @comment
  #   else
  #     respond_with @comment.errors
  #   end
  # end


  # def destroy
  #   @comment = Comment.find(params[:id])
  #   respond_with @comment.destroy
  # end

private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end

end
