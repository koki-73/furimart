class ItemsController < ApplicationController
  
  before_action :set_item, only: [:edit, :update]
  
  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end
  
  def get_category_grandchildren
    child_id = child_params[:child_id]
    @category_grandchildren = Category.find(child_id).children 
  end
  
  def set_images
    @images = ItemImage.where(item_id: params[:id])
  end

  def index
    @items = Item.includes(:item_images).order("id DESC").limit(3)
    @items_brand = Item.where(brand: "nike").includes(:item_images).order("id DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = Category.where(ancestry: nil)
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

  def edit
    @category_parent_array = Category.where(ancestry: nil)
    @item_images = ItemImage.where(item_id: @item.id)
    @category_grandchild = Category.find(@item.category_id)
    @category_child = @category_grandchild.parent
    @category_parent = @category_child.parent
    @category_children = Category.find(@category_parent.id).children
    @category_grandchildren = Category.find(@category_child.id).children
  end

  def update
    @item_images = ItemImage.where(item_id: @item.id)

    image_form_count = item_params_update[:item_images_attributes].to_hash.length
    image_count = @item_images.length
    delete_image_count = 0
    count = 0
    while count < image_count do
      if item_params_update[:item_images_attributes].values[count][:"_destroy"] == "1"
        delete_image_count += 1
      end
      count += 1
    end

    if delete_image_count != image_count || image_form_count != image_count
      @item.update(item_params_update)
      redirect_to root_path
    else
      redirect_to edit_item_path(params[:id])
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


  def item_params_update
    category_id = params.permit(:category_id)
    params.require(:item).permit(:name, :price, :item_explanation, :status, :brand, :delivery_fee, :delivery_method, :delivery_from_location, :preparation_day, :price, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id).merge(category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

