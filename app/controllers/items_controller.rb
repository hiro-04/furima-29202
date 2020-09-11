class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      binding.pry
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  private

  def item_params
    params.require(:item).permit(:title, :content, :category_id, :status_id, :burden_id, :area_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end
