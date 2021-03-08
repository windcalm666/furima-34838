class ItemsController < ApplicationController
 
 
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item, :text, :price, :category_id, :status_id, :charge_id, :day_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end
