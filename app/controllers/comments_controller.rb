class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to item_path(comment.item.id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end