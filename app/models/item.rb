class Item < ApplicationRecord
  betongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :explanation
    validates :name 
    validates :price, format: { with: /\A[a-z\d]+\z/i, message:'は半角英数字で入力してください。'}
    validates :category
    validates :status
    validates :charge
    validates :area
    validates :date
  end  
end
