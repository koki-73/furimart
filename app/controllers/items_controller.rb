class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.item_images.new
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
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      
      redirect_to new_item_path
    end
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
  
  def item_params
    params.require(:item).permit(:name, :price, item_images_attributes: [:image])
  end

end
