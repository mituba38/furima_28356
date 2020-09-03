require 'rails_helper'

RSpec.describe SaleAdress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test.jpeg')
      @item.save
      @sale_address = FactoryBot.build(:sale_adress, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end
    
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@sale_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @sale_address.postal_code = nil
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号にハイフンが無いと保存できないこと' do
      @sale_address.postal_code = '1234567'
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Postal code はハイフンを含めて入力して下さい")
    end
    it '都道府県が空だと保存できないこと' do
      @sale_address.prefecture_id = ''
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @sale_address.city = ''
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @sale_address.address = ''
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できないこと' do
      @sale_address.phone_number = nil
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が12桁以上だと保存できないこと' do
      @sale_address.phone_number = '09012345678901'
      @sale_address.valid?
      expect(@sale_address.errors.full_messages).to include("Phone number は11桁以内で入力して下さい")
    end
  end
end
