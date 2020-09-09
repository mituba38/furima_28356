class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :adress, dependent: :destroy
end
