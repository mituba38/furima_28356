class SaleAdress
  include ActiveModel::Model
  attr_accessor :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :token, :item_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :token
    validates :city
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含めて入力して下さい' }
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'は11桁以内で入力して下さい' }
  end
  def save
    sale = Sale.create(user_id: user_id, item_id: item_id)
    Adress.create(sale_id: sale.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number)
  end
end
