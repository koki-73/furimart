class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@comment.item.id)
    else
      @item = Item.find(@comment.item.id)
      @comments = @item.comments.includes(:user)
      @category_grandchild = Category.find(@item.category)
      @category_child = @category_grandchild.parent
      @category_parent = @category_child.parent
      render template: "items/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end