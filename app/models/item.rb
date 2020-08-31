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
    validates :image
    validates :user
    validates :explanation
    validates :name
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
    validates :category
    validates :status
    validates :charge
    validates :prefecture
    validates :schedule
    validates :prefecture_id, numericality: { other_than: 0 }
  end
end
