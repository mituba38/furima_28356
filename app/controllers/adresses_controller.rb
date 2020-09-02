class AdressesController < ApplicationController
  def create
    @adress = Adress.new(adress_params)
  end
end
