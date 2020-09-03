class SalesController < ApplicationController
  before_action :set_item, only: [:index,:new,:create,:pay_item]
  def index
  end  

  def new
    @sale = SaleAdress.new
  end

  def create
    sale_adress = SaleAdress.new(sale_params)
    if sale_adress.valid?
      pay_item
      sale_adress.save
      return redirect_to root_path
    else
      render :index
    end
  end  

  private

  def sale_params
    params.permit(:price, :token, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  
      card: sale_params[:token],    
      currency:'jpy'                 
    )
  end
   
  def set_item
    @item = Item.find(params[:item_id])
  end
end