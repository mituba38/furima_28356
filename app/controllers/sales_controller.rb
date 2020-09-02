class SalesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @sale = SaleAdress.new
  end  

  def create
    @sale = SaleAdress.new(price: sale_params[:price])
    if @sale.valid?
      pay_item
      @sale.save
      return redirect_to root_path
    else
      render 'index'
    end
  end  

  private

  def sale_params
    params.require(:sale_adress).permit(:price, :token, :user, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end

  def pay_item
    Payjp.api_key = "sk_test_4ee6f7d5e208a5a9e3b14622"  
    Payjp::Charge.create(
      amount: sale_params[:price],  
      card: sale_params[:token],    
      currency:'jpy'                 
    )
  end
   
end
