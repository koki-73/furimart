class ItemsController < ApplicationController
  def index

  end

  def new
    @item = Item.new   
    @category_parent_array = Category.where(ancestry: nil)

    # Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array << parent.name
    # end

    # @category_parent_array_name = []
    # @category_parent_array_id = []
    # Category.where(ancestry: nil).each do |parent|
    #   @category_parent_array_name << parent.name
    #   @category_parent_array_id << parent.id
    # end
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
  end
  private
  def child_params
    params.permit(:child_id)
  end
end



