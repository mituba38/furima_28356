class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    item.destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    item.update(item_params)  
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
