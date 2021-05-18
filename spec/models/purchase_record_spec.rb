require 'rails_helper'

  RSpec.describe PurchaseRecord, type: :model do
    before do
      @item = FactoryBot.build(:item)
      @user = FactoryBot.build(:user)
      @purchase_record_shipping = FactoryBot.build(:purchase_record_shipping)
    end
  
    describe '商品購入' do
      context '商品購入できるとき' do
        it '全ての情報を正しく入力すれば、商品出品できる' do
          expect(@purchase_record_shipping).to be_valid
        end
      end

      context '商品購入できないとき' do
        it 'postal_codeが空では購入できない' do
          @purchase_record_shipping.postal_code = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Postal code  can't be blank")
        end

        it 'postal_codeが全角数字では購入できないこと' do
          @purchase_record_shipping.postal_code= '１２３-４５６７'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Postal code is invalid")
        end

        it 'postal_codeにハイフンが入っていないと購入できないこと' do
          @purchase_record_shipping.postal_code= '1234567'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Postal code is invalid")
        end

        it 'shipping_area_idが空では購入できない' do
          @purchase_record_shipping.shipping_area_id = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Shipping area id can't be blank")
        end

        it 'shipping_area_id選択が--では購入できない' do
          @purchase_record_shipping.shipping_area_id = 1
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Shipping area id must be other than 1")
        end

        it 'municipalityが空では購入できない' do
          @purchase_record_shipping.municipality = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Municipality can't be blank")
        end
  
        it 'addressが空では購入できない' do
          @purchase_record_shipping.address = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Address can't be blank")
        end
  
        it 'addressの中の数字が全角数字では購入できないこと' do
          @purchase_record_shipping.address= '３-７'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Address is invalid")
        end

        #it 'building_nameが空では購入できない' do
          #@purchase_record_shipping.building_name = ''
          #@purchase_record_shipping.valid?
          #expect(@purchase_record_shipping.errors.full_messages).to include ("Building name can't be blank")
        #end

        #it 'building_nameの中の数字が全角では購入できない' do
          #@purchase_record_shipping.building_name = '３０２'
          #@purchase_record_shipping.valid?
          #expect(@purchase_record_shipping.errors.full_messages).to include ("Building name is invalid")
        #end
  
        it 'phone_numberが空では購入できない' do
          @purchase_record_shipping.phone_number = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Phone number can't be blank")
        end
  
        it 'phone_numberが全角数字では購入できないこと' do
          @purchase_record_shipping.phone_number= '１２３４５６７８９１２'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Phone number is invalid")
        end

        it 'phone_numberが合計で9字以下では購入できないこと' do
          @purchase_record_shipping.phone_number= '123456789'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Phone number is invalid")
        end

        it 'phone_numberにハイフンが入っていると購入できないこと' do
          @purchase_record_shipping.phone_number= '123-4567-8901'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Phone number is invalid")
        end

        it 'user_idが空では購入できない' do
          @purchase_record_shipping.user_id = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("User id can't be blank")
        end

        it 'item_idが空では購入できない' do
          @purchase_record_shipping.item_id = ''
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include ("Item id can't be blank")
        end
        
        it 'userが紐付いていないと保存できないこと' do
          @purchase_record_shipping.user = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('User must exist')
        end
        
        it 'itemが紐付いていないと保存できないこと' do
          @purchase_record_shipping.item = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Item must exist')
        end

        it 'shippingが紐付いていないと保存できないこと' do
          @purchase_record_shipping.shipping = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Shipping must exist')
        end
      end
    end
  end
        #it 'purchase_recordが紐付いていないと保存できないこと' do
          #@.purchase_record = nil
          #@.valid?
          #expect(@.errors.full_messages).to include('Purchase record must exist')
        #end
