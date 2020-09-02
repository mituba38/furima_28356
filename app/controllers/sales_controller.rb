class SalesController < ApplicationController
  def index
  end  
  def create
    @sale = Sale.new(sale_params)
  end  
   
end
