class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :sales

  # validates :password, length: { minimum: 6, too_short: 'は最低６文字必要です' }
  validates :password, format: { with: /\A[a-z\d]+\z/i, message: 'は半角英数字で入力してください。' }
  validates :nickname, presence: true
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください。' }
  validates :last_name, presence: true
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角で入力してください。' }
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
  validates :birth_date, presence: true

  # Include default devise modules. Others available are:

  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end
