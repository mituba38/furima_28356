class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

    validates :first_name,presence: true
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください。"}
    validates :last_name,presence: true
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください。"}
    validates :first_name_kana,presence: true
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :last_name_kana,presence: true
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :birth_date,presence: true



  # Include default devise modules. Others available are:
  
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 
end
