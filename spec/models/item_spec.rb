require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての情報を正しく入力すれば、商品出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("画像を入力してください")
      end

      it 'titleが空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("タイトルを入力してください")
      end

      it 'category_idが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("カテゴリーを入力してください")
      end

      it 'category_id選択が--では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("カテゴリーは1以外の値にしてください")
      end

      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("販売価格を入力してください")
      end

      it 'priceが全角数字では出品できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include ("販売価格は不正な値です")
      end

      it 'priceが¥300を下回ると出品できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include ("販売価格は300以上の値にしてください")
      end
      
      it 'priceが¥9,999,999を上回ると出品できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("販売価格は9999999以下の値にしてください")
      end

      it 'item_descriptionが空では出品できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品の説明を入力してください")
      end

      it 'status_idが空では出品できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品の状態を入力してください")
      end

      it 'status_id選択が--では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("商品の状態は1以外の値にしてください")
      end


      it 'shipping_fee_idが空では出品できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("配送料の負担を入力してください")
      end
     
      it 'shipping_fee_id選択が--では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("配送料の負担は1以外の値にしてください")
      end


      it 'shipping_area_idが空では出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送元の地域を入力してください")
      end

      it 'shipping_area_id選択が--は出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送元の地域は1以外の値にしてください")
      end

      it 'shipping_date_idが空では出品できない' do
        @item.shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送までの日数を入力してください")
      end

      it 'shipping_date_id選択が--では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("発送までの日数は1以外の値にしてください")
      end
  
      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
