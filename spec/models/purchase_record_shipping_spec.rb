require 'rails_helper'

  RSpec.describe PurchaseRecordShipping, type: :model do 
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      sleep 0.5
      @purchase_record_shipping = FactoryBot.build(:purchase_record_shipping, user_id: @user.id, item_id: @item.id)
    end
  
    describe '商品購入' do
      context '商品購入できるとき' do
        it '全ての情報を正しく入力すれば、商品購入できる' do
          expect(@purchase_record_shipping).to be_valid
        end

        it '建物名の記入がなくても登録できること' do
          @purchase_record_shipping.building_name = ''
          expect(@purchase_record_shipping).to be_valid
        end
      end

      context '商品購入できないとき' do
        it 'postal_codeが空では購入できない' do
          @purchase_record_shipping.postal_code = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("郵便番号を入力してください")
        end

        it 'postal_codeが全角数字では購入できないこと' do
          @purchase_record_shipping.postal_code= '１２３-４５６７'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("郵便番号は不正な値です")
        end

        it 'postal_codeにハイフンが入っていないと購入できないこと' do
          @purchase_record_shipping.postal_code= '1234567'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("郵便番号は不正な値です")
        end

        it 'shipping_area_idが空では購入できない' do
          @purchase_record_shipping.shipping_area_id = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("発送元の地域を入力してください")
        end

        it 'shipping_area_id選択が--では購入できない' do
          @purchase_record_shipping.shipping_area_id = 1
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("発送元の地域は1以外の値にしてください")
        end

        it 'municipalityが空では購入できない' do
          @purchase_record_shipping.municipality = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("市区町村を入力してください")
        end
  
        it 'addressが空では購入できない' do
          @purchase_record_shipping.address = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("番地を入力してください")
        end
  
        it 'phone_numberが空では購入できない' do
          @purchase_record_shipping.phone_number = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("電話番号を入力してください")
        end
  
        it 'phone_numberが全角数字では購入できないこと' do
          @purchase_record_shipping.phone_number= '１２３４５６７８９１２'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("電話番号は不正な値です")
        end

        it 'phone_numberが合計で9字以下では購入できないこと' do
          @purchase_record_shipping.phone_number= '123456789'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("電話番号は不正な値です")
        end

        it 'phone_numberにハイフンが入っていると購入できないこと' do
          @purchase_record_shipping.phone_number= '123-4567-8901'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("電話番号は不正な値です")
        end

        it 'user_idが空では購入できない' do
          @purchase_record_shipping.user_id = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Userを入力してください")
        end

        it 'item_idが空では購入できない' do
          @purchase_record_shipping.item_id = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Itemを入力してください")
        end
      
        it "tokenが空では登録できないこと" do
          @purchase_record_shipping.token = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("トークンを入力してください")
        end 
      end
    end
  end
