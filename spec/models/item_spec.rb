require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test.jpeg')
  end

  describe 'アイテム出品機能' do
    context 'アイテム出品がうまくいくとき' do
      it '全てのデータがあれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context 'アイテム出品がうまくいかないとき' do
      it '画像が無いと出品登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が無いと出品登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が無いと出品登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報が無いと出品登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が無いと出品登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担についての情報が無いと出品登録できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end
      it '発送元の地域についての情報が無いと出品登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数についての情報が無いと出品登録できない' do
        @item.schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end
      it '価格についての情報が無いと出品登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格の範囲が¥300~¥9999999の範囲でないと出品登録できない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than 299')
      end
      it '販売価格の範囲が¥300~¥9999999の範囲でないと出品登録できない' do
        @item.price = '100000000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '販売価格が半角数字のみでないと出品登録できない' do
        @item.price = 'あいう'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
