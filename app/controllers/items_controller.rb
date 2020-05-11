class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images).order("id DESC").limit(3)
    @items_brand = Item.where(brand: "nike").includes(:item_images).order("id DESC").limit(3)
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
    @item = Item.new(item_params)
    if item_params[:item_images_attributes]
      if @item.save
        redirect_to root_path
      else
        redirect_to new_item_path
      end
    else
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @images = @item.item_images
    @image = @images.first
    @category_grandchild = Category.find(@item.category_id)
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && item.user_id == current_user.id && item.destroy
      redirect_to root_path
    else
      render "show"
    end
  end
  private
  def child_params
    params.permit(:child_id)
  end
  
  def item_params
    category_id = params.permit(:category_id)
    params.require(:item).permit(:name, :price, :item_explanation, :status, :brand, :delivery_fee, :delivery_method, :delivery_from_location, :preparation_day, :buyer_id, :price, item_images_attributes: [:image]).merge(user_id: current_user.id).merge(category_id)
  end

end
