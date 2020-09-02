class SaleAdress
  
  include ActiveModel::Model
  attr_accessor :user, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number
  
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
  end  
  def save
    sale = Sale.create(user: user, item: item)
    Adress.create(sale_id: sale.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end

end