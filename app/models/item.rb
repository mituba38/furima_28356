class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule
  belongs_to_active_hash :status
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :user
    validates :explanation
    validates :name 
    validates :price, format: { with: /\A[a-z\d]+\z/i, message:'は半角英数字で入力してください。'}
    validates :category
    validates :status
    validates :charge
    validates :prefecture
    validates :schedule
    validates :prefecture_id, numericality: { other_than: 0 }
  end  
end
