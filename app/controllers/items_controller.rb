class ItemsController < ApplicationController
  before_action :set_item, only: [:edit,:update,:destroy,:show]
  before_action :authenticate_user!, only: [:edit,:update,:destroy]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def destroy
    item.destroy
  end

  def edit
  end

  def update
    if @item.update(item_params)  
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
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

  def set_item
    @item = Item.find(params[:id])
  end  
 end
