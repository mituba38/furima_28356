class ItemsController < ApplicationController
  def index
  end
  private

  def item_params
    params.require(:item).permit(:user, :image, :explanation, :name, :price, :category, :status, :charge, :area, :date).merge(user_id: current_user.id)
  end
 end
