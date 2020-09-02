class SalesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end  
  def create
    @sale = Sale.new(sale_params)
  end  
   
end
