class SaleAdress
  
  include ActiveModel::Model
  attr_accessor :user_id, :item, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :item_id
  
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
    # validates :token
    # validates :user_id
    # validates :postal_code
    # validates :prefecture_id
    # validates :city
    # validates :address
    # validates :building
    # validates :phone_number
  end  
  def save
    sale = Sale.create(user_id: user_id, item_id: item_id)
    Adress.create(sale_id: sale.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end

end