class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

   private

  def item_params
    params.require(:item).permit(:user, :image, :explanation, :name, :price, :category_id, :status_id, :charge_id, :prefecture_id, :schedule_id).merge(user_id: current_user.id)
  end
 end
