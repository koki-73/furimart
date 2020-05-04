class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new   
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    child_id = child_params[:child_id]
    @category_grandchildren = Category.find(child_id).children 
  end

  def create
    Item.create
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end
  
  private
  def child_params
    params.permit(:child_id)
  end
end
