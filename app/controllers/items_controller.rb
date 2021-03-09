class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authenticate_user!, except: [:index, :show]
 
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:item, :text, :price, :category_id, :status_id, :charge_id, :day_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end
