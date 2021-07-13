class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if  @comment.save
      redirect_to item_path(params[:item_id])
    else
      @item = @comment.item
      @comments = @item.comments.includes(:user)
      render "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:sentence).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
